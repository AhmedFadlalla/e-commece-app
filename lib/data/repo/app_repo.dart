import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/failure.dart';
import 'package:ecommerce_app_task/core/use_case/base_use_case.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/domain/entities/base_cart_data.dart';
import 'package:ecommerce_app_task/domain/entities/base_cart_product_data.dart';
import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';

import '../../domain/repo/base_app_repo.dart';
import '../data_source/base_remote_data_source.dart';
import '../models/cart_product_data_model.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  AppRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<BaseProductData>>> getProductsData(NoParameters parameter) async{
    final result=await baseRemoteDataSource.getProductsData(parameter);
    try{
      return Right(result);
    }on ServerFailure catch (failure){
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, BaseProductData>> getProductDetails(IdParameter parameter) async{
    final result=await baseRemoteDataSource.getProductDetails(parameter);
    try{
      return Right(result);
    }on ServerFailure catch (failure){
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<BaseCartData>>> getCartProductData(IdParameter parameter)async {
    final result=await baseRemoteDataSource.getCartProductData(parameter);
    try{
      return Right(result);
    }on ServerFailure catch (failure){
      return Left(failure);
    }

  }



  }
