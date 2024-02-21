import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/cubit/navigation_bar_cubit.dart';
import 'package:sanjagh/screens/chat/chat_list_screen.dart';
import 'package:sanjagh/screens/intro/splash_screen.dart';
import 'package:sanjagh/screens/main/home_screen.dart';
import 'package:sanjagh/screens/main/main_screen.dart';
import 'package:sanjagh/screens/profile/my-ad_screen.dart';
import 'package:sanjagh/screens/profile/profile_screen.dart';
import 'package:sanjagh/screens/profile/save_screen.dart';
import 'package:sanjagh/screens/profile/setting_screen.dart';

GoRouter routes = GoRouter(initialLocation: SplashScreen.route, routes: [
  // splash screen
  GoRoute(
      path: SplashScreen.route,
      builder: (context, state) {
        return SplashScreen();
      }),
  // home screen . main screen
  GoRoute(
      path: HomeScreen.rotue,
      builder: (context, state) {
        return  BlocProvider(
          create: (context) => NavigationBarCubit(),
          child: MainScreen(),
        );
      }),
      GoRoute(
        path: ProfileScreen.route,
        builder: (context,state){
          return const ProfileScreen();
        }
      ),
       GoRoute(
        path: ChatListScreen.route,
        builder: (context,state){
          return  ChatListScreen();
        }
      ),


        GoRoute(
        path: MyAdScreen.route,
        builder: (context,state){
          return  MyAdScreen();
        }
      ),

      GoRoute(
        path: AdSaveScreen.route,
        builder: (context,state){
          return  AdSaveScreen();
        }
      ),

 GoRoute(
        path: SettingsScreen.route,
        builder: (context,state){
          return  const SettingsScreen();
        }
      ),



]);
