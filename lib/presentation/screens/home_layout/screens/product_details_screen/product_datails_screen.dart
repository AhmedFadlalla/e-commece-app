import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/product_details_screen/product_details_body.dart';
import 'package:flutter/material.dart';
class ProductDetailsScreen extends StatelessWidget {
  final int id;

  const ProductDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              ProductDetailsBody(id: id),
            ],
          ),
        ),
      ),
    );
  }
}