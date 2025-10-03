import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contact_bottom_sheet_widget.dart';

import '../../../../gen/assets.gen.dart';

class PriceSelectionWidget extends StatefulWidget {
  const PriceSelectionWidget({super.key});

  @override
  State<PriceSelectionWidget> createState() => _PriceSelectionWidgetState();
}

class _PriceSelectionWidgetState extends State<PriceSelectionWidget> {
  int selectedPriceIndex = 1; // Средняя цена tanlangan bo'lsin
  String customPrice = '13 000 000';
  final TextEditingController _customPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _customPriceController.text = customPrice;
  }

  @override
  void dispose() {
    _customPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPriceField('Минимальная цена', '10 000 000 сум', 0),
        SizedBox(height: 16.h),
        
        _buildPriceField('Средняя цена', '13 000 000 сум', 1),
        SizedBox(height: 16.h),
        
        _buildPriceField('Максимальная цена', '16 000 000 сум', 2),
        SizedBox(height: 16.h),
        
        _buildCustomPriceField(),
        SizedBox(height: 30.h),
        
        ButtonWidget(
          color1: Color(0xFF185CAF),
          color2: Color(0xFF104280),
          title: 'Продолжить',
          onPressed: () async {
            // Kontaktlar uchun ruxsat so'rash
            final status = await Permission.contacts.request();
            if (status.isGranted) {
              // Ruxsat berilgan bo'lsa, contact bottom sheet ko'rsatish
              ContactBottomSheetWidget.show(context);
            } else if (status.isDenied) {
              // Ruxsat rad etilgan bo'lsa, xabar ko'rsatish
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Разрешение на доступ к контактам отклонено')),
              );
            } else if (status.isPermanentlyDenied) {
              // Ruxsat doimiy rad etilgan bo'lsa, sozlamalarga yo'naltirish
              openAppSettings();
            }
          },
        ),
      ],
    );
  }

  Widget _buildPriceField(String label, String price, int index) {
    bool isSelected = selectedPriceIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedPriceIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF718093),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF0D6EFD).withOpacity(0.1) : Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
              border: isSelected ? Border.all(color: Color(0xFF0D6EFD), width: 2) : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Color(0xFF0D6EFD) : Colors.grey[800],
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF0D6EFD),
                    size: 24.r,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Предложите свою цену',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF718093),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  customPrice,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Container(
                height: 20.h,
                width: 1.w,
                color: Colors.grey[400],
              ),
              SizedBox(width: 12.w),
              InkWell(
                onTap: () {
                  _showEditPriceDialog();
                },
                child: Text(
                  'Изменить',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D6EFD),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditPriceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Изменить цену'),
          content: TextField(
            controller: _customPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Введите цену',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  customPrice = _customPriceController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
