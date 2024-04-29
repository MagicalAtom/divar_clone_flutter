import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/controllers/AdController.dart';
import 'package:sanjagh/controllers/CityController.dart';
import 'package:sanjagh/cubit/accordion/cubit/accordion_cubit.dart';
import 'package:sanjagh/cubit/ads/cubit/ads_cubit.dart';
import 'package:sanjagh/data/models/City.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class AccordionWidgtet extends StatelessWidget {
  AccordionWidgtet(
      {super.key,
      required this.title,
      required this.province_id,
      required this.pagingController});
  String title;
  String province_id;
  PagingController pagingController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccordionCubit(),
      child: Accordion(
        title: title,
        province_id: province_id,
        pagingController: pagingController,
      ),
    );
  }
}

class Accordion extends StatefulWidget {
  Accordion(
      {super.key,
      required this.title,
      required this.province_id,
      required this.pagingController});
  String title;
  String province_id;
  PagingController pagingController;
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late List<City> cities;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _heightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    cities = AdController().getCities(widget.province_id);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.read<AccordionCubit>().changeAccordionStatus(_controller);
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.black.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(AppSize.level1)),
              child: Row(
                children: [
                  width(10),
                  CustomText(
                    text: widget.title,
                    fontFamily: Font.name('b'),
                    fontSize: 14.0,
                  ),
                  const Spacer(),
                  BlocBuilder<AccordionCubit, AccordionStatusState>(
                    builder: (context, state) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: state.status
                            ? const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.chevron_left,
                                    key: ValueKey('open')))
                            : const Icon(Icons.chevron_right,
                                key: ValueKey('close')),
                      );
                    },
                  ),
                  width(10),
                ],
              ),
            ),
          ),
          BlocBuilder<AccordionCubit, AccordionStatusState>(
            builder: (context, state) {
              return SizeTransition(
                sizeFactor: _heightAnimation,
                axis: Axis.vertical,
                child: AnimatedCrossFade(
                  firstChild: Container(height: 0.0),
                  secondChild: BlocProvider(
                    create: (context) => AdsCubit(ServiceLocator.get()),
                    child: AccordionOpen(
                        cities: cities,
                        pagingController: widget.pagingController),
                  ),
                  crossFadeState: state.status
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class AccordionOpen extends StatelessWidget {
  AccordionOpen({
    super.key,
    required this.cities,
    required this.pagingController,
  });

  final List<City> cities;
  PagingController pagingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.level1),
          border: Border.all(width: 1, color: Colors.black.withOpacity(.6))),
      child: ListView.separated(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              CityController().saveUserCity(city: cities[index].name);
              pagingController.value.itemList!.clear(); // clear paginate list , 
              context.read<AdsCubit>().getItems(1, pagingController);  // and rebuild after select a new city
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 40,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.black.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  width(10),
                  CustomText(
                    text: cities[index].name,
                    fontFamily: Font.name('b'),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  width(10),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return height(5);
        },
      ),
    );
  }
}
