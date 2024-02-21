import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/configs/bottom_navigation_bar_items.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/cubit/navigation_bar_cubit.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/categories/category_screen.dart';
import 'package:sanjagh/screens/chat/chat_list_screen.dart';
import 'package:sanjagh/screens/main/home_screen.dart';
import 'package:sanjagh/screens/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<NavigationBarCubit,int>(
      builder: (context,state){
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: (){},
                backgroundColor: AppColor.main,
                child: const Icon(Icons.add,color: Colors.white,size: 35,),
              ),
              Container(height: 40,),
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.background,
          elevation: 0,
          selectedItemColor: AppColor.main,
          selectedLabelStyle: TextStyle(
            fontFamily: Font.name('b'),
            fontSize: Font.size(2) - 4,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: Font.name('b'),
            fontSize: Font.size(2) - 4,
          ),
          currentIndex: state,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            context.read<NavigationBarCubit>().changeIndex(value);
          },
          items: List.generate(items.length, (index) => BottomNavigationBarItem(icon: items[index].icons,label: items[index].lable,activeIcon:items[index].activeIcon,))
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
            height: SizeConfig.screenHeight,
                child: IndexedStack(
                  index: state,
                  children: [
                    HomeScreen(),
                    CategoryListScreen(),
                    HomeScreen(),
                    ChatListScreen(),
                    ProfileScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
      },
    );
  }
}