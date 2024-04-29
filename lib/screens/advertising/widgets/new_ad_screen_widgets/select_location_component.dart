import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/components/map_component.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        context.push(MapComponent.route);
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
              ),
              CustomText(
                text: 'انتخاب لوکیشن',
                fontFamily: Font.name('b'),
              ),
              height(10),
              const Icon(Iconsax.location)
            ],
          )),
    ));
  }
}

