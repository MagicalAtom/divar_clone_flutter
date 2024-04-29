import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/controllers/CityController.dart';
import 'package:sanjagh/cubit/ads/cubit/ads_cubit.dart';
import 'package:sanjagh/cubit/search/cubit/search_cubit.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/screens/main/search_screen.dart';
import 'package:sanjagh/screens/main/select_city_screen.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  HomeAppBarWidget({super.key,required this.pagingController});
  PagingController pagingController;
  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  List<Ad> ads = [];
  String city = 'تهران';
  


  void getUserCity(context) async {
    city = await CityController().getUserCity() as String;
    setState(() {});
  }

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUserCity(context);
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.border!, width: 1),
          borderRadius: BorderRadius.circular(AppSize.level1)),
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          height(50),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => AdBloc(ServiceLocator.get()),
                    ),
                    BlocProvider(create: (context) => SearchCubit())
                  ],
                  child: SearchScreen(),
                );
              }));
            },
            child: SizedBox(
              child: Row(
                children: [
                  Icon(
                    Iconsax.search_normal,
                    color: Colors.grey[800],
                  ),
                  width(8),
                  CustomText(
                    text: 'جستجو در همه آگهی ها',
                    fontFamily: Font.name('m'),
                    fontSize: 17.0,
                    color: Colors.grey[700],
                  )
                ],
              ),
            ),
          )),
          Container(
            height: 40,
            width: 1,
            color: Colors.black.withOpacity(.5),
          ),
          width(5),
          GestureDetector(
              onTap: () {
                context.push(SelectCityScreen.route,extra: widget.pagingController);
              },
              child: Container(
                width: 100  ,
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                    text: city,
                    fontFamily: Font.name('b'),
                    color: Colors.black.withOpacity(.7),
                    fontSize: 14.0,
                    ),
                    width(4),
                    const Icon(Iconsax.location,size: 20)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
