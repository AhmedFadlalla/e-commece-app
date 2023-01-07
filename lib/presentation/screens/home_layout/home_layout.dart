import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/cart_screen.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/fav_screen.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/home_screen.dart';
import 'package:ecommerce_app_task/presentation/screens/home_layout/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget> screens=[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    FavouriteScreen(),
  ];
  List<String> titles=[
    "Home Screen",
    "Search Screen",
    "Cart Screen",
    "Favourite Screen",
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex],),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image(image:
          const AssetImage('assets/icons/home.png'),
            color: currentIndex==0?mainColor:darkThemeColor,
          ),label: "Home"),
          BottomNavigationBarItem(icon: Image(
            image:const AssetImage('assets/icons/search.png'),
            color: currentIndex==1?mainColor:darkThemeColor,
          ),label: "Explore"),
          BottomNavigationBarItem(icon: Image(
            image:const AssetImage('assets/icons/cart.png'),
            color: currentIndex==2?mainColor:darkThemeColor,
          ),label: "Cart"),
          BottomNavigationBarItem(icon: Image(
            image:const AssetImage('assets/icons/fav.png'),
            color: currentIndex==3?mainColor:darkThemeColor,
          ),label: "Favourite"),


        ],
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}
