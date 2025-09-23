import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../gen/assets.gen.dart';



class CreationPage extends StatefulWidget {
  static const String name = 'parking_screen';
  static const String path = '/parking_screen';
  const CreationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreationPageState();
  }
}

class _CreationPageState extends State<CreationPage> {
  late final YandexMapController controller;
  bool showRouteMessage = false;

  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 2.0,
  );

  final List<MapObject> _mapObjects = [];
  Position? _currentPosition;

  CameraPosition initialPosition = const CameraPosition(
    target: Point(latitude: 41.3111, longitude: 69.2797),
    zoom: 14.0,
  );

  @override
  void dispose() {
    super.dispose();
    try {
      if (mounted) {
        controller.dispose();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Dispose error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            cameraBounds: const CameraBounds(minZoom: 1, maxZoom: 20),
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;

              controller.toggleUserLayer(visible: true);

              await controller.moveCamera(
                CameraUpdate.newCameraPosition(initialPosition),
                animation: animation,
              );

              _showMyPosition();
            },
            onMapTap: (Point point) async {
              await controller.deselectGeoObject();
            },
            zoomGesturesEnabled: true,
            mapObjects: _mapObjects,
          ),

          Positioned(
            bottom: 0.h,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 270.h,

                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Center(
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                          color: AppColor.veryDark,
                        ),
                        width: 51.w,
                        height: 5.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 19.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.w,
                          vertical: 9.w,
                        ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12.r),
                         color: AppColor.veryDark,
                       ),
                        child: Row(
                          children: [
                          SvgPicture.asset(Assets.svg.sss.path, width: 28.r,height: 28.r,fit: BoxFit.fill,),
                            SizedBox(width: 10.w,),
                            Text('Usmon Nosir street(Tashkent), 6',
                              style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.black
                              ) ,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    InkWell(
                      onTap: (){
                     context.pushNamed(RoutersName.createOrderName);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w, ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11.w,
                            vertical: 9.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColor.veryDark,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svg.locations.path, width: 28.r,height: 28.r,fit: BoxFit.fill,),
                              SizedBox(width: 10.w,),
                              Text('Куда едем?',
                                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black
                                ) ,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  /// Foydalanuvchi joylashuvini ko‘rsatish
  void _showMyPosition() async {
    if (_currentPosition != null) {
      final newCameraPosition = CameraPosition(
        target: Point(
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude,
        ),
        zoom: 14.0,
      );

      controller.moveCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    }
  }
}
