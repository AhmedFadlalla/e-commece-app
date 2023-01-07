

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/failure.dart';
import 'package:ecommerce_app_task/core/use_case/base_use_case.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';

import '../entities/base_cart_data.dart';
import '../entities/base_cart_product_data.dart';

abstract class BaseAppRepository {


Future<Either<Failure,List<BaseProductData>>> getProductsData(NoParameters parameter);
Future<Either<Failure,BaseProductData>> getProductDetails(IdParameter parameter);
Future<Either<Failure,List<BaseCartData>>> getCartProductData(IdParameter parameter);

}