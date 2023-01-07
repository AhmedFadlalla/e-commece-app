import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';
import 'package:ecommerce_app_task/presentation/screens/component/compenent.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/product_details_screen/product_datails_screen.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/product_details_screen/product_details_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
buildProductItem({required BaseProductData data})=>ScreenUtilInit(
  builder: (BuildContext context, Widget? child) =>InkWell(
    child: Container(
      height: 240.51.h,
      width: 173.32.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.grey.shade400)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 150.71,
                height: 70.11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      data.image,
                      errorBuilder: (context, object, stackTrace) {
                        return Image.asset('assets/icons/Group.png');
                      },
                    ).image,

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              data.title,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 15.sp, color: Colors.black),
            ),
            Text(
              "\$${data.price}",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 16.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      navigateTo(context, ProductDetailsScreen(id: data.id,));

    },
  ),
);