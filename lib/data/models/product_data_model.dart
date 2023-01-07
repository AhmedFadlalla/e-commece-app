
import '../../domain/entities/base_product_data.dart';

class ProductDataModel extends BaseProductData{
 const  ProductDataModel({required super.id, required super.image, required super.title, required super.price, required super.description,required super.category});

 factory ProductDataModel.fromJson(Map<String,dynamic>json)=>
     ProductDataModel(id: json["id"], image: json["image"], title: json["title"], price:json["price"] , category: json["category"],description: json["description"]);
}