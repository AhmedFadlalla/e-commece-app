import 'package:ecommerce_app_task/presentation/controller/home_event.dart';
import 'package:ecommerce_app_task/presentation/controller/home_state.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/shared_component/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../controller/home_bloc.dart';
import '../../component/compenent.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetProductsDataEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
              children: [
                  defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onsubmit: (value){
                        print(state.productsData);
                        sl<HomeBloc>().add(SearchForProductEvent(name: value,productData: state.productsData));
                      },
                      validator: (value) {},
                  label: "Search"),
                if(state.productSearchState==RequestState.loaded)
                  buildProductItem(data: state.productSearch!)
              ],
            ),
                ));
          },
          listener: (context, state) {}),
    );
  }
}
