import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/home_bloc.dart';
import '../../../../controller/home_event.dart';
import '../../../../controller/home_state.dart';
import '../../../component/compenent.dart';
import 'display_datailsComponent.dart';
class ProductDetailsBody extends StatelessWidget {
  final int id;
  const ProductDetailsBody({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>sl<HomeBloc>()..add(GetProductDetailsEvent(id: id)),
      child: BlocConsumer<HomeBloc,HomeState>(
        builder: (context,state){
          switch(state.productDetailsState){
            case RequestState.loading:
              return const Center(child:  CircularProgressIndicator(),);
            case RequestState.loaded:
              var data=state.productDetails;
              return  ScreenUtilInit(builder: (BuildContext context, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 413.6.w,
                            height: 371.44.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffF2F3F2),
                              borderRadius:  BorderRadius.only(topLeft: const Radius.circular(0),topRight: const Radius.circular(0),bottomLeft: Radius.circular(25.r),bottomRight: Radius.circular(25.r)),
                              image: DecorationImage(
                                image:Image.network(
                                  data!.image,
                                  fit: BoxFit.fitWidth,
                                  errorBuilder: (context, object, stackTrace) {
                                    return Image.asset('assets/icons/Group.png');
                                  },
                                ).image
                                ,
                              ),
                            ),

                          ),
                          Positioned(child: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon:const  Icon(Icons.arrow_back_ios_new_rounded))),


                        ],
                      ),
                      SizedBox(height: 25.h,),
                      Text(
                        data.title,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 17.sp),
                      ),
                      SizedBox(height: 18.h,),
                      myDivider(),
                      SizedBox(height: 18.h,),
                      Text(
                        "${data.price}\$",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 25.sp),
                      ),
                      SizedBox(height: 18.h,),
                      myDivider(),
                      SizedBox(height: 18.h,),
                      Text(
                        "Category: ${data.category}",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18.sp),
                      ),
                      SizedBox(height: 18.h,),
                      myDivider(),
                      DisplayDetailsComponent(id: id),
                      myDivider(),
                      
                    ],
                  ),
                );
              },);
            case RequestState.error:
              return Center(child: Text(state.productDetailsMessage),);

          }
        },
        listener: (context,state){

        },
      ),
    );
  }
}