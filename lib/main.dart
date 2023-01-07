import 'package:ecommerce_app_task/core/utils/observer.dart';
import 'package:ecommerce_app_task/presentation/controller/home_bloc.dart';
import 'package:ecommerce_app_task/presentation/controller/home_event.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/services/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_color.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await  DioHelper.init();
  ServicesLocator().init();
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: lightScaffoldColor,
            fontFamily: GoogleFonts.poppins(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ).fontFamily,
            textTheme:  TextTheme(
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 45.sp
                ),
                caption: TextStyle(
                    fontSize: 17.sp,
                    color: lightScaffoldColor,
                    fontWeight: FontWeight.w400

                ),
                bodyText1: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    height: 25.h
                )
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: mainColor,
                unselectedItemColor: darkThemeColor,
                showUnselectedLabels: true,
                selectedIconTheme: IconThemeData(
                  color: mainColor,

                )
            ),
            appBarTheme:   AppBarTheme(
              backgroundColor: Colors.grey.shade600,

            )
        ),
        home: const HomeLayout(),
      );
    },);
  }
}


