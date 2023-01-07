import 'package:ecommerce_app_task/core/utils/enum.dart';
import 'package:ecommerce_app_task/domain/entities/base_cart_product_data.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/base_cart_data.dart';
import '../../domain/entities/base_product_data.dart';

class HomeState extends Equatable {
  final List<BaseProductData> productsData;
  final RequestState productsDataState;
  final String productsDataMessage;
  final BaseProductData? productDetails;
  final RequestState productDetailsState;
  final String productDetailsMessage;
  final List<BaseCartData> cartProductData;
  final RequestState cartProductDataState;
  final String cartProductDataMessage;
  final BaseProductData? productSearch;
  final RequestState productSearchState;
  final String productSearchMessage;

 const  HomeState({
    this.productsData=const [],
    this.productsDataState=RequestState.loading,
    this.productsDataMessage='',
   this.productDetails,
   this.productDetailsState=RequestState.loading,
   this.productDetailsMessage='',
   this.cartProductData=const [],
   this.cartProductDataState=RequestState.loading,
   this.cartProductDataMessage='',
   this.productSearch,
   this.productSearchState=RequestState.loading,
   this.productSearchMessage=''
  });

  HomeState copyWith({
    List<BaseProductData>? productsData,
    RequestState? productsDataState,
    String? productsDataMessage,
    BaseProductData? productDetails,
    RequestState? productDetailsState,
    String? productDetailsMessage,
    List<BaseCartData>? cartProductData,
    RequestState? cartProductDataState,
    String? cartProductDataMessage,
    BaseProductData? productSearch,
    RequestState? productSearchState,
    String? productSearchMessage,
})=>HomeState(
    productsData: productsData??this.productsData,
    productsDataState: productsDataState??this.productsDataState,
    productsDataMessage: productsDataMessage??this.productsDataMessage,
    productDetails: productDetails??this.productDetails,
    productDetailsState: productDetailsState??this.productDetailsState,
    productDetailsMessage: productDetailsMessage??this.productDetailsMessage,
    cartProductData: cartProductData??this.cartProductData,
    cartProductDataState: cartProductDataState??this.cartProductDataState,
    cartProductDataMessage: cartProductDataMessage??this.cartProductDataMessage,
    productSearch: productSearch??this.productSearch,
    productSearchState: productSearchState??this.productSearchState,
    productSearchMessage: productSearchMessage??this.productSearchMessage
  );

  @override
  List<Object?> get props => [
    productsData,productsDataState,productsDataMessage,
    productDetails,productDetailsMessage,productDetailsState,
    cartProductData,cartProductDataMessage,cartProductDataState,
    productSearch,productSearchState,productSearchMessage
  ];
}
