import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:sanjagh/configs/app_url.dart';
import 'package:sanjagh/configs/dio_config.dart';
import 'package:sanjagh/controllers/AuthController.dart';
import 'package:sanjagh/data/datasources/ads/ads_datasource.dart';
import 'package:sanjagh/data/datasources/ads/ads_datasource_interface.dart';
import 'package:sanjagh/data/datasources/authentication/authentication_datasource.dart';
import 'package:sanjagh/data/datasources/authentication/authentication_datasource_interface.dart';
import 'package:sanjagh/data/datasources/category/category_datasource.dart';
import 'package:sanjagh/data/datasources/category/category_local_datasource.dart';
import 'package:sanjagh/data/datasources/location/neshan_datasource.dart';
import 'package:sanjagh/data/repositories/ads/ads_repository.dart';
import 'package:sanjagh/data/repositories/ads/ads_repository_interface.dart';
import 'package:sanjagh/data/repositories/authentication/authentication_repository.dart';
import 'package:sanjagh/data/repositories/authentication/authentication_repository_interface.dart';
import 'package:sanjagh/data/repositories/category/category_repository.dart';
import 'package:sanjagh/data/repositories/category/category_repository_interface.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/libs/AuthManager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sanjagh/cubit/province/cubit/province_cubit.dart';
GetIt ServiceLocator = GetIt.I;

Future initDio() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.get
    )
  );
  bool auth = await AuthManager.isLogin();
  if(auth){
    String getToken = await AuthManager().getToken();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['Authorization'] = 'Bearer ${getToken}';
        options.headers['Accept-Encoding'] = 'gzip, deflate, br';
        return handler.next(options);
      },
    ));
  } 
  dio.interceptors.add(DioConfig());
  ServiceLocator.registerSingleton<Dio>(dio);
}


initLibs() async {
  ServiceLocator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  ServiceLocator.registerSingleton<AuthManager>(AuthManager());
  ServiceLocator.registerSingleton<SaveFormValue>(SaveFormValue(ServiceLocator.get()));
}

initControllers(){
  ServiceLocator.registerSingleton<AuthController>(AuthController(ServiceLocator.get()));
}

initDataSources(Box box){
  ServiceLocator.registerSingleton<AuthenticationDataSourceInterFace>(AuthenticationDataSource(ServiceLocator.get(),ServiceLocator.get()));
  ServiceLocator.registerSingleton<CategoryDataSource>(CategoryDataSource(ServiceLocator.get()));
  ServiceLocator.registerSingleton<CategoryLocalDataSource>(CategoryLocalDataSource(box));
  ServiceLocator.registerSingleton<Neshan>(Neshan());
  ServiceLocator.registerSingleton<AdsDataSourceInterface>(AdsDataSource(ServiceLocator.get()));
}


initRepositories(){
  ServiceLocator.registerSingleton<AuthenticationRepositoryInterface>(AuthenticationRepository(ServiceLocator.get()));
  ServiceLocator.registerSingleton<CategoryRepositoryInterFace>(CategoryRepository(ServiceLocator.get(),ServiceLocator.get()));
  ServiceLocator.registerSingleton<AdsRepositoryInterFace>(AdsRepository(ServiceLocator.get()));
}


initCubits(){
  ServiceLocator.registerSingleton<ProvinceCubit>(ProvinceCubit());
}