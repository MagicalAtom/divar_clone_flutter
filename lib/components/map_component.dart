import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location/location.dart';
import 'package:sanjagh/bloc/location/bloc/location_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class MapComponent extends StatefulWidget {
  MapComponent({super.key, required this.saveFormValue});
  static const String formValue = 'location';
  static const String route = '/set-location';
  SaveFormValue saveFormValue;

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  late MapController mapController;
  LocationData? locationData;
  bool open = false;
  double? lat;
  double? lng;
  String address = '';
  bool closePage = false;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  Future getUserLocation() async {
    // نمایش لوکیشن کاربر
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    mapController.move(
        LatLng(locationData!.latitude!, locationData!.longitude!),
        15); // وقتی لوکیشن کاربر دریافت شد بیاد و مارکر رو ببره روی لوکیش کاربر
  }

  @override
  Widget build(BuildContext context) {
    close();
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await getUserLocation(); // وقتی روی دکمه کلیک شد لوکیش کاربر رو دریافت کنه
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.level2),
                  color: AppColor.main),
              child: const Icon(
                Iconsax.location,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          height(10),
          GestureDetector(
            onTap: () async {
              await acceptModal(context);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.level2),
                  color: AppColor.main),
              child: const Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
            initialCenter: const LatLng(35.72484160, 51.38165300),
            initialZoom: 15,
            onPositionChanged: (MapPosition position, bool status) async {
              // اگه کاربر در صفحه نقشه جا به جا شد مقدار پوزیشن تغییر میکنه
              mapController.move(position.center!,
                  15); // اینجا مجدد میگیم که مقدار پوزیشن مارکر رو با استفاده از تغییراتی که کاربر میده تغیر بده
              lat = position.center!.latitude;
              lng = position.center!.longitude;
              setState(() {});
            },
            onMapReady: () async {
              // وقتی مپ آماده به کار میشه این تابع فراخوانی میشه
              await getUserLocation(); // اینجا میگیم در شروع کار مپ این تابع فراخوانی بشه تا هم مارکر نمایش داده بشه هم لوکیشن پیشفرض کاربر رو به دست بیاریم
              await acceptModal(context);
            }),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          locationData != null ? marker(mapController.center) : Container(),
          // باید بعد از مپ قرار بگیره . بالا مپ لود میشه پایین باید مارکر باشه تا زیر مپ مخفی نشه
          const RichAttributionWidget(
            attributions: [],
          ),
        ],
      )),
    );
  }

  marker(LatLng point) {
    return MarkerLayer(
      markers: [
        Marker(
            point: point,
            child: const Icon(
              Iconsax.location,
              size: 40,
              color: AppColor.main,
            ))
      ],
    );
  }

  acceptModal(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) {
              final bloc = LocationBloc(ServiceLocator.get());
              if (lat != null && lng != null) {
                bloc.add(LocationRequest(lat!, lng!));
              } else {
                bloc.add(LocationRequest(
                    locationData!.latitude!, locationData!.longitude!));
              }
              return bloc;
            },
            child: Container(
              height: 150,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.level2)),
              child: Column(
                children: [
                  height(AppSize.level1),
                  ElevatedButton(
                    onPressed: () {
                      widget.saveFormValue
                          .saveFormValue(MapComponent.formValue, address);
                      // Pop the modal sheet
                      context.pop();
                      context.pop();

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.main,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.level1),
                        ),
                        minimumSize: const Size(180, 50)),
                    child: CustomText(
                      text: 'تایید آدرس',
                      fontFamily: Font.name('b'),
                      fontSize: Font.size(3),
                      color: Colors.white,
                    ),
                  ),
                  height(20),
                  BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                    if (state is LocationLoading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingComponent(),
                        ],
                      );
                    } else if (state is LocationRequestState) {
                      address = state.userLocation.address;
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            CustomText(
                                size: SizeConfig.screenWidth,
                                text: state.userLocation.address,
                                fontFamily: Font.name('m'),
                                fontSize: Font.size(2))
                          ],
                        ),
                      );
                    }
                    return const Text('');
                  })
                ],
              ),
            ),
          );
        });
  }

  close() {
    closePage ? context.pop() : null;
  }
}
