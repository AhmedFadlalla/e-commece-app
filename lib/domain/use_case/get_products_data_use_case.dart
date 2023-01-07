import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_task/core/error/failure.dart';
import 'package:ecommerce_app_task/core/use_case/base_use_case.dart';
import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';
import 'package:ecommerce_app_task/domain/repo/base_app_repo.dart';

class GetProductsDataUseCase extends BaseUseCase<List<BaseProductData>,NoParameters>{
  final BaseAppRepository baseAppRepository;

  GetProductsDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductData>>> call(NoParameters parameter) async{
    return await baseAppRepository.getProductsData(parameter);
  }
}