import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/cubit/search/cubit/search_cubit.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/single_ad_detail_screen.dart';
import 'package:sanjagh/screens/main/widgets/ad_home_screen_widget.dart';
import 'package:sanjagh/screens/main/widgets/search_text_filed_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.addListener(
      () {
        if (controller.text.isEmpty) {
        context.read<SearchCubit>().searchClose();
        }
      },
    );
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: SearchInputWidget(
              controller: controller,
              onChanged: (String value) {
                if(value.isEmpty){
                  context.read<SearchCubit>().searchClose();
                }else{
                  context.read<SearchCubit>().searchOpen();
                  context.read<AdBloc>().add(SearchAdEvent(value.toString()));
              }
              },
            )),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchCloseState) {
              return Center(
                child: CustomText(
                  text: 'جستجو آگهی مورد نظر شما از میان هزاران آگهی سنجاق',
                ),
              );
            } else if (state is SearchOpenState) {
              return BlocBuilder<AdBloc, AdState>(builder: (context, state) {
                if (state is AdLoading) {
                  return LoadingComponent();
                } else if (state is SearchAdState) {
                  return state.ads.fold((failed) {
                    return Text(failed.message);
                  }, (success) {
                    if (success.isNotEmpty) {
                      return ListView.builder(
                        itemCount: success.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              AdHomeWidget(
                                  onTap: () {
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
                                  price: success[index].price),
                              Divider(
                                color: Colors.grey[400],
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: SizeConfig.screenWidth,
                          ),
                          CustomText(
                            text: 'آگهی مورد نظر پیدا نشد',
                            fontFamily: Font.name('b'),
                          ),
                          height(10),
                          Image.asset(AppKey.not_found_img),
                        ],
                      );
                    }
                  });
                }
                return Text('');
              });
            }
            return const Text('');
          },
        ));
  }
}
