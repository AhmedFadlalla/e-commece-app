import 'package:ecommerce_app_task/presentation/controller/home_event.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/shared_component/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../controller/home_bloc.dart';
import '../../../controller/home_state.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>sl<HomeBloc>()..add(GetProductsDataEvent()),
    child: BlocConsumer<HomeBloc,HomeState>(builder: (context, state) {
      switch(state.productsDataState){
        case RequestState.loading:
          return const Center(child: CircularProgressIndicator());
        case RequestState.loaded:
          var data=state.productsData;
          return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
            return Padding(padding: const EdgeInsets.all(8),
              child:GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 9/11,
                  shrinkWrap: true,
                  children:  List.generate(state.productsData.length,
                        (index) {
                      return buildProductItem(data: data[index]);
                    } ,)),


            );
          },);
        case RequestState.error:
          return  Center(child: Text(state.productsDataMessage));
      }
    }, listener: (context, state) {}),);
  }
}
