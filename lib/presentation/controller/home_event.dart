
import 'package:equatable/equatable.dart';

import '../../domain/entities/base_product_data.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetProductsDataEvent extends HomeEvent{}
class GetProductDetailsEvent extends HomeEvent{
  final int id;

  const GetProductDetailsEvent({required this.id});
}
class GetCartProductEvent extends HomeEvent{
  final int id;

  const GetCartProductEvent({required this.id});
}
class SearchForProductEvent extends HomeEvent{
  final List<BaseProductData> productData;
  final String  name;

  const SearchForProductEvent({required this.name,required this.productData});
}