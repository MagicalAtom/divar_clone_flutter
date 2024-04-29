import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/bloc/category/bloc/category_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/ads/cubit/ads_cubit.dart';
import 'package:sanjagh/cubit/last_category/cubit/last_category_cubit.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/libs/Translator.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/single_ad_detail_screen.dart';
import 'package:sanjagh/screens/main/widgets/ad_home_screen_widget.dart';
import 'package:sanjagh/screens/main/widgets/app_bar_widget.dart';
import 'package:sanjagh/screens/main/widgets/category_widget.dart';
import 'package:sanjagh/screens/main/widgets/last_view_widget.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String rotue = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<int, Ad> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>()
      ..add(CategoryRequestEvent())
      ..add(GetHistoryCategoryEvent());
    pagingController.addPageRequestListener((page) {
      context.read<AdsCubit>().getItems(page, pagingController);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fa', Translator());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) {
          return LastCategoryCubit(ServiceLocator.get())..get();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.background,
            title: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AdBloc(ServiceLocator.get()),
                ),
                BlocProvider(
                  create: (context) => AdsCubit(ServiceLocator.get()),
                )
              ],
              child: HomeAppBarWidget(
                pagingController: pagingController,
              ),
            ),
          ),
          backgroundColor: AppColor.background,
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.level3, vertical: AppSize.level2),
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor: AppColor.background,
                        toolbarHeight: SizeConfig.screenHeight! / 1.9,
                        flexibleSpace: FlexibleSpaceBar(
                          background: topHeader(),
                        ),
                      ),
                    ];
                  },
                  body: SizedBox(
                    height: SizeConfig.screenHeight! + 1002,
                    child: RefreshIndicator(
                      color: AppColor.main,
                      onRefresh: refresh,
                      child: PagedListView<int, Ad>(
                        pagingController: pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Ad>(
                          animateTransitions: true,
                          itemBuilder: (context, item, index) {
                            return Column(
                              children: [
                                AdHomeWidget(
                                    onTap: () {
                                      context.read<LastCategoryCubit>().add(
                                          Category(item.category_list_id,
                                              item.category, ''));
                                      context.push(SingleAdDetail.route,
                                          extra: item);
                                    },
                                    title: item.name,
                                    status: timeago.format(DateTime.tryParse(item.created_at.toString())!,locale: 'fa'),
                                    image: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CacheImage(
                                          getFullImagePath(item.gallery[0].path),
                                          context),
                                    ),
                                    location: item.map,
                                    price: item.price),
                                const Divider(
                                  height: 0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget topHeader() {
    return Column(
      children: [
        BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state is CategoryLoadingState) {
            return LoadingComponent();
          } else if (state is CategoryRequestState) {
            return state.categories.fold((left) {
              return Text(left.message);
            }, (right) {
              return Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 140,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryHomeWidget(
                        name: right[index].name,
                        id: right[index].id,
                        icon: CacheImage(
                            getFullImagePath(right[index].icon), context),
                      );
                    },
                    itemCount: right.length,
                  ),
                  height(15),
                  BlocBuilder<LastCategoryCubit, LastCategoryState>(
                    builder: (context, state) {
                      if (state is LastCategoryResponseState) {
                        if(state.categories.isNotEmpty){
                             return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'بازدید های اخیر',
                                  fontFamily: Font.name('b'),
                                  fontSize: Font.size(2),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                            height(15),
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                itemCount: state.categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      padding: const EdgeInsets.all(4),
                                      child: LastViewWidget(
                                          title:
                                              state.categories[index].name));
                                },
                              ),
                            ),
                          ],
                        );
                        }
                      }
                      return const Text('');
                    },
                  ),
                ],
              );
            });
          }
          return const Text('');
        }),
        height(10),
        Divider(
          color: Colors.grey[400],
        ),
      ],
    );
  }
  Future<void> refresh() async {
    Future.delayed(const Duration(seconds: 1));
    pagingController.itemList!.clear();
     context.read<AdsCubit>().getItems(1, pagingController);
  }
}