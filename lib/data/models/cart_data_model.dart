import 'package:ecommerce_app_task/domain/entities/base_cart_data.dart';
import 'package:ecommerce_app_task/domain/entities/base_cart_product_data.dart';

class CartDataModel extends BaseCartData{
  const CartDataModel({required super.title, required super.quantity, required super.image, required super.totalPrice});



  Map<String,dynamic> toMap()=>{
    "title":title,
    "quantity":quantity,
    "image":image,
    "totalPrice":totalPrice
  };
}