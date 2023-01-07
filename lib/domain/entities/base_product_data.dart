import 'package:equatable/equatable.dart';

class BaseProductData extends Equatable {
  final int id;
  final String image;
  final String title;
  final num price;
  final String category;
  final String description;


  const BaseProductData({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
   required this.category
  });




  @override
  List<Object?> get props => [
    id,image,title,description,price,category
  ];
}
