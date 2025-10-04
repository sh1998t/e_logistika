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
import '../widgets/swipe_fill_button.dart';



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
  String selectedDestination = 'Куда едем?';

  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 2.0,
  );

  final List<MapObject> _mapObjects = [];
  Position? _currentPosition;
  String _currentLocationName = 'Joylashuv yuklanmoqda...';

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
            bottom: selectedDestination == 'Куда едем?' ? 300.h : 360.h,
            right: 16.w,
            child: FloatingActionButton(
              onPressed: () {
                _showMyPosition();
              },
              backgroundColor: Colors.white,
              child:SvgPicture.asset(Assets.svg.gpsFixed.path,width: 32.r,height: 32.r,fit: BoxFit.fill,),
            ),
          ),

          Positioned(
            bottom: 0.h,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: selectedDestination == 'Куда едем?' ? 260.h : 320.h,

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
                            Text(_currentLocationName,
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
                      onTap: () async {
                        final result = await context.pushNamed(RoutersName.createSearchPageName);
                        if (result != null && mounted) {
                          setState(() {
                            selectedDestination = result.toString();
                          });
                        }
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
                              Text(selectedDestination,
                                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: selectedDestination == 'Куда едем?' 
                                        ? AppColor.greyColor2
                                        : AppColor.greyColor2
                                ) ,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),

                    // SwipeFillButton faqat manzil tanlangandan keyin ko'rsatiladi
                    if (selectedDestination != 'Куда едем?') ...[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
                      child:   SizedBox(
                        height: 56,
                        child: SwipeFillButton(

                          leadingSvg: SvgPicture.asset(Assets.svg.arrows.path, width:54.w,height: 19.h,),
                            color1: Color(0xFF285CAF),
                            color2: Color(0xFF104280),
                            titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white
                            ),
                            title: "Проведите для подтверждения",
                          onCompleted: () {
                            context.pushNamed(RoutersName.createTwoName);
                          },),
                      ),
                      ),
                    ]

                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  // Geolocation ruxsatini tekshirish va so'rash
  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Location xizmati yoqilganligini tekshirish
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (kDebugMode) {
        print('Location services are disabled.');
      }
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (kDebugMode) {
          print('Location permissions are denied');
        }
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (kDebugMode) {
        print('Location permissions are permanently denied, we cannot request permissions.');
      }
      return false;
    }

    return true;
  }

  // Joylashuv nomini olish (reverse geocoding)
  Future<void> _getLocationName(double latitude, double longitude) async {
    try {
      final (session, resultFuture) = await YandexSearch.searchByPoint(
        point: Point(latitude: latitude, longitude: longitude),
        searchOptions: const SearchOptions(),
      );

      final result = await resultFuture;

      if (result.error != null) {
        if (kDebugMode) {
          print('Xatolik: ${result.error}');
        }
        setState(() {
          _currentLocationName = 'Joylashuv nomi topilmadi';
        });
        return;
      }

      if (result.items != null && result.items!.isNotEmpty) {
        final topResult = result.items!.first;
        final address = topResult.toponymMetadata?.address.formattedAddress ?? 'Joylashuv nomi topilmadi';
        
        setState(() {
          _currentLocationName = address;
        });
        
        if (kDebugMode) {
          print('Manzil: $address');
        }
      } else {
        setState(() {
          _currentLocationName = 'Joylashuv nomi topilmadi';
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting location name: $e');
      }
      setState(() {
        _currentLocationName = 'Joylashuv nomi topilmadi';
      });
    }
  }

  // Hozirgi joylashuvni olish
  Future<void> _getCurrentLocation() async {
    try {
      bool hasPermission = await _checkLocationPermission();
      if (!hasPermission) {
        if (kDebugMode) {
          print('Location permission not granted');
        }
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      // Joylashuv nomini olish
      await _getLocationName(position.latitude, position.longitude);

      if (kDebugMode) {
        print('Current position: ${position.latitude}, ${position.longitude}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting location: $e');
      }
    }
  }

  void _showMyPosition() async {
    // Avval joylashuvni olish
    await _getCurrentLocation();
    
    if (_currentPosition != null) {
      final newCameraPosition = CameraPosition(
        target: Point(
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude,
        ),
        zoom: 14.0,
      );

      // Eski markerlarni tozalash
      _mapObjects.clear();
      
      // Foydalanuvchi joylashuviga marker qo'shish
      _mapObjects.add(
        PlacemarkMapObject(
          mapId: const MapObjectId('user_location'),
          point: Point(
            latitude: _currentPosition!.latitude,
            longitude: _currentPosition!.longitude,
          ),
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('assets/icons/logo.png'),
              scale: 1.0,
            ),
          ),
        ),
      );

      // State ni yangilash
      setState(() {});
      
      controller.moveCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    }
  }
}
