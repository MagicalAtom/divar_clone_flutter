import 'package:flutter/material.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/last_category/cubit/last_category_cubit.dart';
import 'package:sanjagh/screens/advertising/ad_list_screen.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryHomeWidget extends StatelessWidget {
   CategoryHomeWidget({super.key,required this.name,required this.icon,required this.id});
  final icon;
  final name;
  final id;
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                  create: (context) => AdBloc(ServiceLocator.get()),
                    ),
                    BlocProvider(
                  create: (context) => LastCategoryCubit(ServiceLocator.get()),
                    ),
                  ],
                  child: AdListScreen(
                    category_id: int.parse(id),
                    category_name: name,
                  ),
                );
              }));
    },
     child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: 113,
          height: 70,
          decoration: BoxDecoration(
        color: AppColor.grey,
        border: Border.all(width: 3,color:AppColor.grey!),
        borderRadius: BorderRadius.circular(AppSize.level1)
      ),
      child: Center(child: SizedBox(width: 25,height: 25,child: icon,),),
        ),
        CustomText(text: name,fontFamily: Font.name('b'))
      ],
     ),
   ) ;
  }
}