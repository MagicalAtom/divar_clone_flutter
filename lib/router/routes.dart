import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:sanjagh/bloc/category/bloc/category_bloc.dart';
import 'package:sanjagh/bloc/location/bloc/location_bloc.dart';
import 'package:sanjagh/components/map_component.dart';
import 'package:sanjagh/cubit/ads/cubit/ads_cubit.dart';
import 'package:sanjagh/cubit/category/cubit/category_cubit.dart';
import 'package:sanjagh/cubit/navigation/navigation_bar_cubit.dart';
import 'package:sanjagh/cubit/province/cubit/province_cubit.dart';
import 'package:sanjagh/cubit/statusAd/cubit/status_ad_cubit.dart';
import 'package:sanjagh/screens/advertising/ad_category_create_screen.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/screens/advertising/single_ad_detail_screen.dart';
import 'package:sanjagh/screens/authentication/login_screen.dart';
import 'package:sanjagh/screens/authentication/register_screen.dart';
import 'package:sanjagh/screens/chat/chat_list_screen.dart';
import 'package:sanjagh/screens/intro/splash_screen.dart';
import 'package:sanjagh/screens/main/home_screen.dart';
import 'package:sanjagh/screens/main/main_screen.dart';
import 'package:sanjagh/screens/main/select_city_screen.dart';
import 'package:sanjagh/screens/profile/my-ad_screen.dart';
import 'package:sanjagh/screens/profile/profile_screen.dart';
import 'package:sanjagh/screens/profile/setting_screen.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';

GoRouter routes = GoRouter(initialLocation: SplashScreen.route, routes: [
  // ====================== initial Route ====================================== //
  GoRoute(
      path: SplashScreen.route,
      builder: (context, state) {
        return SplashScreen();
      }),




  // ======================= Home Screen =========================================//
  GoRoute(
      path: HomeScreen.rotue,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NavigationBarCubit(),
            ),
            BlocProvider(
              create: (context) => CategoryBloc(ServiceLocator.get())
              ),
              BlocProvider(
                create: (context) => AdsCubit(ServiceLocator.get()),
              )
          ],
          child: MainScreen(),
        );
      }),    

  // ========================= Authentication Routes ============================== //
  GoRoute(
      path: RegisterScreen.route,
      builder: (content, state) {
        return BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(ServiceLocator.get()),
          child: RegisterScreen(),
        );
      }),

  GoRoute(
      path: LoginScreen.route,
      builder: (content, state) {
        return BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(ServiceLocator.get()),
          child: LoginScreen(),
        );
      }),


  // ========================================= application Map ======================================== //
  GoRoute(
      path: MapComponent.route,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => LocationBloc(ServiceLocator.get()),
          child: MapComponent(
            saveFormValue: ServiceLocator.get(),
          ),
        );
      }),


  // ============================= Select Category in Create Ad Screen =============================== //
  GoRoute(
      path: AdCategoryListScreen.route,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                final categoryBloc = CategoryBloc(ServiceLocator.get());
                categoryBloc.add(CategoryRequestEvent());
                return categoryBloc;
              },
            ),
            BlocProvider(
              create: (context) => CategoryCubit(ServiceLocator.get()),
            ),
          ],
          child:  AdCategoryListScreen(),
        );
      }),

    // ============================= profile screen ===================================== //
    GoRoute(
      path: ProfileScreen.route,
      builder: (context, state) {
        return const ProfileScreen();
      }),


      GoRoute(
      path: MyAdScreen.route,
      builder: (context, state) {
        return BlocProvider(
          create: (context) {
            final bloc = AdBloc(ServiceLocator.get());
            bloc.add(getMyAds());
            return bloc;
          },
          child: MyAdScreen(),
        );
      }),

  // ==================== More Route (Chat Screen & Ad Detail & Create new Ad)
  
  GoRoute(
      path: ChatListScreen.route,
      builder: (context, state) {
        return ChatListScreen();
      }),

  GoRoute(
      path: SingleAdDetail.route,
      builder: (context, state) {
        return SingleAdDetail();
      }),


  GoRoute(
    path: SelectCityScreen.route,
    builder: (context, state) {
    return SelectCityScreen();  
    },
  ),


  GoRoute(
      path: NewAdScreen.route,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoryCubit(ServiceLocator.get()),
            ),
            BlocProvider(
              create: (context) => StatusAdCubit(),
            ),
            BlocProvider(
              create: (context) => AdBloc(ServiceLocator.get()),
            ),
            BlocProvider<ProvinceCubit>.value(
              value: ServiceLocator.get<ProvinceCubit>(),
            )
          ],
          child: NewAdScreen(),
        );
      }),
]);
