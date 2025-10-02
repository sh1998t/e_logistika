import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contact_bottom_sheet_widget.dart';

import '../../../../gen/assets.gen.dart';

class PriceSelectionWidget extends StatelessWidget {
  const PriceSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPriceField('Минимальная цена', '10 000 000 сум', false),
        SizedBox(height: 16.h),
        
        _buildPriceField('Средняя цена', '13 000 000 сум', true),
        SizedBox(height: 16.h),
        
        _buildPriceField('Максимальная цена', '16 000 000 сум', false),
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

  Widget _buildPriceField(String label, String price, bool isSelected) {
    return Column(
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
            color: isSelected ? Colors.blue[50] : Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              if (isSelected)
                SvgPicture.asset(Assets.svg.group321.path)
            ],
          ),
        ),
      ],
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
                  '13 000 000',
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
              Text(
                'Изменить',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
