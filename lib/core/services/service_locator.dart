

import 'package:ecommerce_app_task/domain/use_case/get_product_details_use_case.dart';
import 'package:get_it/get_it.dart';



import '../../data/data_source/base_remote_data_source.dart';
import '../../data/repo/app_repo.dart';
import '../../domain/repo/base_app_repo.dart';
import '../../domain/use_case/get_cart_product_data_use_case.dart';
import '../../domain/use_case/get_products_data_use_case.dart';
import '../../presentation/controller/home_bloc.dart';
final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory<HomeBloc>(() => HomeBloc(sl(),sl(),sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case


    sl.registerLazySingleton<GetProductsDataUseCase>(() =>GetProductsDataUseCase(sl()) );
    sl.registerLazySingleton<GetProductDetailsUseCase>(() =>GetProductDetailsUseCase(sl()) );
    sl.registerLazySingleton<GetCartProductDataUseCase>(() =>GetCartProductDataUseCase(sl()) );


    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource());
  }

}