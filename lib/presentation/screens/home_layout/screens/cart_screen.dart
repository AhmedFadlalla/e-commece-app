import 'package:ecommerce_app_task/domain/entities/base_product_data.dart';
import 'package:ecommerce_app_task/presentation/controller/home_bloc.dart';
import 'package:ecommerce_app_task/presentation/controller/home_event.dart';
import 'package:ecommerce_app_task/presentation/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../../domain/entities/base_cart_data.dart';
import '../../component/compenent.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>sl<HomeBloc>()..add(const GetCartProductEvent(id: 4)),
    child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
      switch(state.cartProductDataState){
        case RequestState.loading:
          return const Center( child: CircularProgressIndicator(),);
        case RequestState.loaded:
          return ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildCartItem(state.cartProductData[index], context),
                            separatorBuilder: (context, index) =>
                                myDivider(),
                            itemCount: state.cartProductData.length),
                      ),
                    ),
                    defaultButton(
                        function: () {

                          var nameController = TextEditingController();
                          var emailController = TextEditingController();
                          var addressController = TextEditingController();
                          var cityController = TextEditingController();
                          var phoneController = TextEditingController();
                          var formKey = GlobalKey<FormState>();
                          // showModalBottomSheet(
                          //     context: context,
                          //
                          //     builder: (context) {
                          //       return SingleChildScrollView(
                          //         child: BlocProvider(
                          //           create: (BuildContext context) => sl<OrderBloc>(),
                          //           child: BlocConsumer<OrderBloc, BaseOrderState>(
                          //             listener: (context, state) {
                          //               if (state is SendOrderDataSuccessState) {
                          //                 showToast(
                          //                     text: "Order Submit Successfully",
                          //                     state: ToastStates.SUCCESS);
                          //                 navigateTo(context, PaymentScreen());
                          //               }
                          //             },
                          //             builder: (context, state) {
                          //               return Form(
                          //                 key: formKey,
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.all(15.0),
                          //                   child: Column(
                          //                     mainAxisSize: MainAxisSize.min,
                          //                     children: [
                          //                       // SizedBox(height: 500,),
                          //                       Center(
                          //                           child: Text(
                          //                             "Final Form",
                          //                             style: Theme.of(context)
                          //                                 .textTheme
                          //                                 .headline1!
                          //                                 .copyWith(color: Colors.black, fontSize: 18),
                          //                           )),
                          //                       defaultFormField(
                          //                           controller: nameController,
                          //                           type: TextInputType.text,
                          //                           label: "Name",
                          //                           validator: (value) {
                          //                             if (value.isEmpty) {
                          //                               return 'Name Must not be empty';
                          //                             }
                          //                             return null;
                          //                           }),
                          //                       SizedBox(
                          //                         height: 12.h,
                          //                       ),
                          //                       defaultFormField(
                          //                           controller: emailController,
                          //                           type: TextInputType.text,
                          //                           label: "Email",
                          //                           validator: (value) {
                          //                             if (value.isEmpty) {
                          //                               return 'Email Must not be empty';
                          //                             }
                          //                             return null;
                          //                           }),
                          //                       SizedBox(
                          //                         height: 12.h,
                          //                       ),
                          //                       defaultFormField(
                          //                           controller: phoneController,
                          //                           type: TextInputType.text,
                          //                           label: "Phone",
                          //                           validator: (value) {
                          //                             if (value.isEmpty) {
                          //                               return 'Phone Must not be empty';
                          //                             }
                          //                             return null;
                          //                           }),
                          //                       SizedBox(
                          //                         height: 12.h,
                          //                       ),
                          //                       defaultFormField(
                          //                           controller: addressController,
                          //                           type: TextInputType.text,
                          //                           label: "Address",
                          //                           validator: (value) {
                          //                             if (value.isEmpty) {
                          //                               return 'Address Must not be empty';
                          //                             }
                          //                             return null;
                          //                           }),
                          //                       SizedBox(
                          //                         height: 12.h,
                          //                       ),
                          //                       defaultFormField(
                          //                           controller: cityController,
                          //                           type: TextInputType.text,
                          //                           label: "City",
                          //                           validator: (value) {
                          //                             if (value.isEmpty) {
                          //                               return 'City Must not be empty';
                          //                             }
                          //                             return null;
                          //                           }),
                          //                       SizedBox(
                          //                         height: 5.h,
                          //                       ),
                          //                       defaultButton(
                          //                           function: () {
                          //                             if (formKey.currentState!.validate()) {
                          //                               sl<OrderBloc>().add(SendOrderDataEvent(
                          //                                   id: 0,
                          //                                   name: nameController.text,
                          //                                   email: emailController.text,
                          //                                   address: addressController.text,
                          //                                   phone: phoneController.text,
                          //                                   city: cityController.text,
                          //                                   orderProducts: const [],
                          //                                   totalPrice: 250));
                          //                             }
                          //                           },
                          //                           text: "Submit")
                          //                     ],
                          //                   ),
                          //                 ),
                          //               );
                          //             },
                          //           ),
                          //         ),
                          //       );
                          //     });
                        },
                        text: "Go to checkout"),
                  ],
                ),
              );
            },
          );
        case RequestState.error:
         return Center(child: Text(state.cartProductDataMessage));
      }
    }, listener: (context,state){}),);
  }
  Widget buildCartItem(BaseCartData data, context) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70.71,
                  height: 64.11,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(data.image).image)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 11.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "quantity: ${data.quantity}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.grey, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "${data.totalPrice}kg,Price",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.grey, fontSize: 13.sp),
                  ),
                ],
              ),

            ],
          ),
        ),
      );

}
