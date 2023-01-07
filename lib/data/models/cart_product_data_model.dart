
import '../../domain/entities/base_cart_product_data.dart';

class CartProductDataModel extends BaseCartProductData {
  const CartProductDataModel(
      {required super.productId, required super.quantity, });

  factory CartProductDataModel.fromJson(Map<String, dynamic> json)=>
      CartProductDataModel(
          productId: json["productId"],
          quantity: json["quantity"] );

}