import 'dart:async';

import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreationMapPage extends StatefulWidget {
  static const String name = 'creation_map_page';
  static const String path = '/creation_map_page';
  const CreationMapPage({super.key});

  @override
  State<CreationMapPage> createState() => _CreationMapPageState();
}

class _CreationMapPageState extends State<CreationMapPage> {
  final mapController = Completer<YandexMapController>();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  late final YandexMapController controller;

  Position? _currentPosition;
  bool isInitialized = true;

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  Future<void> _showMyPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition = position;

      final newCameraPosition = CameraPosition(
        target: Point(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
        zoom: 13.0, // Changed to zoom 13
      );

      await controller.moveCamera(
        CameraUpdate.newCameraPosition(newCameraPosition),
      );
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            cameraBounds: const CameraBounds(minZoom: 1, maxZoom: 20),
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: false,
            rotateGesturesEnabled: true,
            onMapCreated: (YandexMapController yandexMapController) {
              controller = yandexMapController;
              mapController.complete(yandexMapController);
            },
          ),

          // Current location button
          Positioned(
            top: 400,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              onPressed: _showMyPosition,
              backgroundColor: Colors.white,
              child: SvgPicture.asset('assets/svg/Vector.svg', width: 28.r,height: 28.r,),
            ),
          ),

          // Bottom panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             SizedBox(
               height: 96.h,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                        Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SvgPicture.asset('assets/svg/Vector.svg',
                                 height: 24.r,
                                   width: 24.r,
                                   fit: BoxFit.fill,
                                 ),
                                 SizedBox(
                                   height: 20.h,
                                   width: 1.2.w,
                                   child: CustomPaint(
                                                     painter: DashedLinePainter(),
                                   ),
                                 ),
                                SvgPicture.asset('assets/svg/Vector1.svg',
                                  height: 24.r,
                                  width: 24.r,
                                  fit: BoxFit.fill,
                                ),


                               ],
                             ),
                 SizedBox(
                   height: 80.h,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TextField(
                         controller: _fromController,
                         decoration: const InputDecoration(
                           hintText: 'Откуда',
                           border: InputBorder.none,
                           contentPadding: EdgeInsets.symmetric(vertical: 8),
                         ),
                       ),
                       Divider(height: 2),
                       TextField(
                         controller: _toController,
                         decoration: const InputDecoration(
                           hintText: 'Куда',
                           border: InputBorder.none,
                           contentPadding: EdgeInsets.symmetric(vertical: 8),
                         ),
                       ),
                     ],
                   ),
                 )

               ],),
             ),
                  SizedBox(height: 100.h,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var dashWidth = 5;
    var dashSpace = 5;
    double startX = size.width / 2;
    double startY = 0;
    double endY = size.height;

    for (double i = startY; i < endY; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(startX, i),
        Offset(startX, i + dashWidth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Agar oldDelegate null bo'lsa yoki yangi chizish kerak bo'lsa, true qaytaradi
    return oldDelegate == null || oldDelegate != this;
  }
}

