import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/failure.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';
import 'package:ecommerce_app_task/domain/repo/base_app_repo.dart';

import '../../core/use_case/base_use_case.dart';

class GetProductDetailsUseCase extends BaseUseCase<BaseProductData,IdParameter>{
  final BaseAppRepository baseAppRepository;


  GetProductDetailsUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseProductData>> call(IdParameter parameter) async{
    return await baseAppRepository.getProductDetails(parameter);
  }

}