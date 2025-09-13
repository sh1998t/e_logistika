import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CanceledTab extends StatelessWidget {
  final VoidCallback onBackPressed;

  const CanceledTab({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cancel, size: 64, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            "Отмененные заказы",
            style: TextStyle(fontSize: 18.sp, color: Colors.grey),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: onBackPressed,
            child: Text("Назад к главной"),
          ),
        ],
      ),
    );
  }
}