import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/failure.dart';
import 'package:ecommerce_app_task/core/use_case/base_use_case.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/domain/entities/base_cart_product_data.dart';
import 'package:ecommerce_app_task/domain/repo/base_app_repo.dart';

import '../entities/base_cart_data.dart';
import '../entities/base_product_data.dart';

class GetCartProductDataUseCase extends BaseUseCase<List<BaseCartData>,IdParameter>{
  final BaseAppRepository baseAppRepository;

  GetCartProductDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseCartData>>> call(IdParameter parameter) async{
    return await baseAppRepository.getCartProductData(parameter);
  }
}