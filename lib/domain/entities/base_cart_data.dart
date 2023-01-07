import 'package:equatable/equatable.dart';

class BaseCartData extends Equatable {
  final String title;
  final int quantity;
  final String image;
  final num totalPrice;

  const BaseCartData({
    required this.title,
    required this.quantity,
    required this.image,
    required this.totalPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    title,quantity,image,title
  ];
}
