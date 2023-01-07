import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_task/core/use_case/base_use_case.dart';
import 'package:ecommerce_app_task/core/utils/constrant.dart';
import 'package:ecommerce_app_task/core/utils/enum.dart';
import 'package:meta/meta.dart';

import '../../domain/use_case/get_cart_product_data_use_case.dart';
import '../../domain/use_case/get_product_details_use_case.dart';
import '../../domain/use_case/get_products_data_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsDataUseCase getProductsDataUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final GetCartProductDataUseCase getCartProductDataUseCase;
  HomeBloc(this.getProductsDataUseCase,this.getProductDetailsUseCase,this.getCartProductDataUseCase) : super(const HomeState()) {
    on<GetProductsDataEvent>((event, emit) async{
      final result=await getProductsDataUseCase(const NoParameters());
      result.fold((l) => emit(
        state.copyWith(
          productsDataMessage: l.message,
          productsDataState: RequestState.error
        )
      ), (r) => emit(
        state.copyWith(
          productsData: r,
          productsDataState: RequestState.loaded
        )
      ));
    });
    on<GetProductDetailsEvent>((event, emit)async {
      final result=await getProductDetailsUseCase(IdParameter(id: event.id));
      result.fold((l) => emit(
          state.copyWith(
              productDetailsMessage: l.message,
              productsDataState: RequestState.error
          )
      ), (r) => emit(
          state.copyWith(
              productDetails: r,
              productDetailsState: RequestState.loaded
          )
      ));


    });
    on<GetCartProductEvent>((event, emit) async{
      final result=await getCartProductDataUseCase(IdParameter(id: event.id));
      result.fold((l) => emit(
          state.copyWith(
              cartProductDataMessage: l.message,
              cartProductDataState: RequestState.error
          )
      ), (r) => emit(
          state.copyWith(
              cartProductData: r,
              cartProductDataState: RequestState.loaded
          )
      ));
    });
    on<SearchForProductEvent>((event, emit) async{
      for(int i=0;i<event.productData.length;i++){
        print("$i:${event.productData[i].title}");
        print(event.name);
        if(event.name==event.productData[i].title){
          emit(state.copyWith(productSearch: event.productData[i],
              productSearchState: RequestState.loaded));
          break;
        }
      }
      print("Valueeeeeeeeeeeeeeeeeeeeee:${state.productSearch}");
    } );
  }
}
