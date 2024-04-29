import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/components/app_bar_component.dart';
import 'package:sanjagh/components/confirmation_alert.dart';
import 'package:sanjagh/components/snack_bar.dart';
import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/libs/Translator.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/profile/widgets/my-ad_items_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyAdScreen extends StatelessWidget {
  const MyAdScreen({super.key});
  static const route = '/my-ad';
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fa',Translator());
    return Scaffold(
      appBar: appBar('آگهی های من'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<AdBloc,AdState>(builder:(context,state){
                if(state is AdLoading){
                  return LoadingComponent();
                }else if(state is getMyAdsState){
                 return  state.ads.fold(
                    (failed){
                      return Text(failed.message.toString());
                    },
                    (success){
                    if(success.isEmpty){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: double.infinity,height: 200,),
                          Image.asset(AppKey.not_found_img),
                          height(10),
                          CustomText(text: 'هیچ آگهی یافت نشد',fontFamily: Font.name('b'),color: Colors.black,),
                        ],
                      );
                    }else {
                        return SizedBox(
                        height: SizeConfig.screenHeight,
                        child: ListView.separated(
                          itemCount: success.length,
                          itemBuilder: (context, index) {
                          return Column(
                            children: [
                              MyAdItemWidget(onDeleteButton: () async {
                                await ConfirmationAlertComponent(context: context,onSuccess: (){
                                  context.read<AdBloc>().add(deleteAdEvent(success[index].id));
                                  Navigator.pop(context);
                                  showMessage('آگهی مورد نظر با موفقیت حذف شد', context);
                                }, onCancel: (){}, text: 'آیا از حذف این آگهی مطمئن هستید ؟', title: 'حذف آگهی');
                              },title: success[index].name, image: CacheImage(getFullImagePath(success[index].gallery[0].path), context), time:timeago.format(DateTime.tryParse(success[index].created_at.toString())!,locale: 'fa',),location: success[index].map,
                              ),
                              height(10),
                            ],
                          );  
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
            height: 0,
          );
                          },
                        ),
                      );
                    }
                    }
                  );
                }
                return Text('');
              })
             
              
            ],
          ),
        ),
      ),
    );
  }
}