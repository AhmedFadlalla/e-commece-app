import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/exceptions.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/core/utils/end_point.dart';
import 'package:ecommerce_app_task/data/models/cart_product_data_model.dart';
import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';

import '../../core/network/error_message_model.dart';
import '../../core/services/dio_helper.dart';
import '../../core/use_case/base_use_case.dart';
import '../../domain/entities/base_cart_product_data.dart';
import '../models/cart_data_model.dart';
import '../models/product_data_model.dart';


abstract class BaseRemoteDataSource {
  Future<List<ProductDataModel>> getProductsData(NoParameters parameter);
  Future<ProductDataModel> getProductDetails(IdParameter parameter);
  Future<List<CartDataModel>> getCartProductData(IdParameter parameter);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ProductDataModel>> getProductsData(NoParameters parameter) async{
    final response=await DioHelper.getData(url: products);
    if(response.statusCode==200){
      return List<ProductDataModel>.from((response.data as List).map((e) => ProductDataModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ProductDataModel> getProductDetails(IdParameter parameter) async{
    final response=await DioHelper.getData(url: getProductById(parameter.id));
    if(response.statusCode==200){
      return ProductDataModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<CartDataModel>> getCartProductData(IdParameter parameter) async{
    final response=await DioHelper.getData(url: getCartById(parameter.id));
    List<CartDataModel> list=[];
    if(response.statusCode==200){

      List<CartProductDataModel> data=List<CartProductDataModel>.from((response.data["products"] as List).map((e) => CartProductDataModel.fromJson(e)));
      for(int i=0;i<=data.length-1;i++){
        final result=await DioHelper.getData(url: getProductById(data[i].productId));
        list.add(CartDataModel(title: result.data["title"], quantity: data[i].quantity, image: result.data["image"], totalPrice: data[i].quantity *result.data["price"] ));
      }
      return list;





    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}
