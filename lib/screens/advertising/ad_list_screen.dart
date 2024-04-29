import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/cubit/last_category/cubit/last_category_cubit.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/single_ad_detail_screen.dart';
import 'package:sanjagh/screens/main/widgets/ad_home_screen_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class AdListScreen extends StatefulWidget {
  AdListScreen(
      {super.key, required this.category_id, required this.category_name});
  int category_id;
  String category_name;
  @override
  State<AdListScreen> createState() => _AdListScreenState();
}

class _AdListScreenState extends State<AdListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdBloc>().add(getCategoriesAdsEvent(widget.category_id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: AppColor.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: widget.category_name,
              fontFamily: Font.name('m'),
              fontSize: Font.size(2),
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            height(10),
            BlocBuilder<AdBloc, AdState>(builder: (context, state) {
              if (state is AdLoading) {
                return LoadingComponent();
              } else if (state is getCategoriesAds) {
                return state.ads.fold((failedLoad) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      height(10),
                      CustomText(text: failedLoad.message),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<AdBloc>()
                              .add(getCategoriesAdsEvent(widget.category_id));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.main,
                            minimumSize: const Size(100, 40)),
                        child: CustomText(
                          text: 'تلاش مجدد',
                          fontFamily: Font.name('b'),
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                }, (success) {
                  if (success.isNotEmpty) {
                    return SizedBox(
                      height: SizeConfig.screenHeight! - 100,
                      child: ListView.separated(
                        itemCount: success.length,
                        itemBuilder: (context, index) {
                          return AdHomeWidget(
                              onTap: () {
                                context.read<LastCategoryCubit>().add(Category(
                                    success[index].category_list_id,
                                    success[index].category,
                                    ''));
                                context.push(SingleAdDetail.route,
                                    extra: success[index]);
                              },
                              title: success[index].name,
                              status: success[index].status,
                              image: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CacheImage(
                                    getFullImagePath(
                                        success[index].gallery[0].path),
                                    context),
                              ),
                              location: success[index].map,
                              price: success[index].price);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 0,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/not-found.png'),
                          height(10),
                          CustomText(
                            text: 'آگهی یافت نشد',
                            fontFamily: Font.name('b'),
                            fontSize: Font.size(3),
                          ),
                        ],
                      ),
                    );
                  }
                });
              }
              return const Text('');
            })
          ],
        ),
      ),
    );
  }
}
