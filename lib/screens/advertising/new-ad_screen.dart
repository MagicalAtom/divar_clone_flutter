import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/components/app_bar_component.dart';
import 'package:sanjagh/components/map_component.dart';
import 'package:sanjagh/components/snack_bar.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/category/cubit/category_cubit.dart';
import 'package:sanjagh/cubit/province/cubit/province_cubit.dart';
import 'package:sanjagh/helpers/ThousandsFormatter.dart';
import 'package:sanjagh/helpers/validation.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_category_widget.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_city_component.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_images_component.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_location_component.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_province_component.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_status_widget.dart';
import 'package:sanjagh/screens/advertising/widgets/text_field_component_new_ad_screen_widget.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/controllers/AdController.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class NewAdScreen extends StatefulWidget {
  NewAdScreen({super.key});
  static const route = '/new-ad';
  AdController adController = AdController();
  @override
  State<NewAdScreen> createState() => _NewAdScreenState();
}

class _NewAdScreenState extends State<NewAdScreen> {
  @override
  void dispose() {
    super.dispose();
    widget.adController.disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getItem();
    widget.adController.location =
        widget.adController.saveFormValue.getFormValue(MapComponent.formValue);
    return Scaffold(
      appBar: appBar('آگهی جدید'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
          child: Column(
            children: [
              Form(
                key: widget.adController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectCategory(widget: widget),
                    height(15),
                    TextFormFieldWidget(
                        controller: widget.adController.title,
                        name: 'title',
                        placeholder: 'عنوان آگهی را وارد کنید',
                        textInputFormatter: const [],
                        title: 'عنوان آگهی',
                        validator: NotNullable()),
                    TextFormFieldWidget(
                        controller: widget.adController.price,
                        name: 'price',
                        placeholder: 'قیمت آگهی را وارد کنید',
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          ThousandsFormatter(),
                        ],
                        title: 'قیمت آگهی',
                        validator: getInt()),
                    SelectStatus(
                      widget: widget,
                    ),
                    SelectProvince(
                      widget: widget,
                    ),
                    BlocBuilder<ProvinceCubit, int>(
                      builder: (context, state) {
                        if(widget.adController.province.isNotEmpty){
                        return SelectCity(widget: widget,cities: widget.adController.getCities(widget.adController.province),saveFormValue: ServiceLocator.get(),);
                        }
                        return Container();
                      },
                    ),
                    TextFormFieldWidget(
                        controller: widget.adController.phone,
                        name: 'phone',
                        placeholder: 'شماره موبایل',
                        textInputFormatter: const [],
                        title: 'شماره تماس آگهی',
                        validator: IranPhoneNumberValidator()),
                    TextFormFieldWidget(
                      controller: widget.adController.description,
                      name: 'description',
                      placeholder: 'توضیحات آگهی را وارد کنید',
                      textInputFormatter: const [],
                      title: 'توضیحات آگهی',
                      validator: NotNullable(),
                      isBigTextField: true,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: 'اطلاعات آگهی',
                              fontFamily: Font.name('b'),
                              fontSize: 16.0,
                            ),
                          ],
                        ),
                        height(10),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          height: 68,
                          child: Row(
                            children: [
                              const SelectLocation(),
                              width(10),
                              SelectImages(widget: widget),
                            ],
                          ),
                        )
                      ],
                    ),
                    BlocBuilder<AdBloc, AdState>(
                      builder: (context, state) {
                        if (state is AdInitial) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.main,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.level1)),
                                    minimumSize: const Size(100,40)
                                  ),
                                  onPressed: () {
                                    if (widget.adController.formKey.currentState!
                                        .validate()) {
                                      if (widget.adController.location == '') {
                                        showMessage(
                                            'لطفا آدرس خود را از طریق نقشه انتخاب کنید',
                                            context);
                                        return;
                                      }
                                      if (widget
                                          .adController.selectedFile.isEmpty) {
                                        showMessage(
                                            'لطفا برای آگهی حداقل یک عکس انتخاب کنید . ',
                                            context);
                                        return;
                                      }
                                      
                                      context.read<AdBloc>().add(AdCreateEvent(
                                            widget.adController.title.text,
                                            widget.adController.status,
                                            widget.adController.price.text,
                                            widget.adController.location!,
                                            widget.adController.selectedCategoryId,
                                            widget.adController.description.text,
                                            widget.adController.selectedFile,
                                            widget.adController.phone.text,
                                            widget.adController.city
                                          ));
                                    }
                                  },
                                  child: CustomText(text: 'ثبت آگهی',fontFamily: Font.name('b'),color: Colors.white,),
                                ),
                              ),
                            ],
                          );
                        } else if (state is AdLoading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoadingComponent(),
                            ],
                          );
                        } else if (state is AdCreateState) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            context.pop();
                            showMessage(
                                'آگهی با موفقیت ثبت شد . پس از تایید ادمین قرار میگیرد',
                                context);
                          });
                        }
                        return const Text('');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
