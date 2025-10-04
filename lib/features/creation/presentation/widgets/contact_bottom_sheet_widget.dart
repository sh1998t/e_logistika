// import 'package:e_logistika/core/constants/app_coler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:io';
// import 'contact_list_widget.dart';
//
// class ContactBottomSheetWidget {
//   static void show(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Container(
//         height: MediaQuery.of(context).size.height * 0.7,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.r),
//             topRight: Radius.circular(20.r),
//           ),
//         ),
//         child: Column(
//           children: [
//             // Handle bar
//             Container(
//               margin: EdgeInsets.only(top: 12.h),
//               width: 40.w,
//               height: 4.h,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2.r),
//               ),
//             ),
//
//             // Header
//             Padding(
//               padding: EdgeInsets.all(20.w),
//               child: Row(
//                 children: [
//                   Text(
//                     'Выберите контакт',
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: Icon(Icons.close, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Contact options
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 children: [
//                   // Platform-specific contact option
//                   if (Platform.isAndroid) ...[
//                     _buildContactOption(
//                       icon: Icons.phone_android,
//                       title: 'Android контакты',
//                       subtitle: 'Выберите из телефонной книги',
//                       onTap: () {
//                         Navigator.pop(context);
//                         ContactBottomSheetDemo();
//                       },
//                     ),
//                   ] else if (Platform.isIOS) ...[
//                     _buildContactOption(
//                       icon: Icons.phone_iphone,
//                       title: 'iOS контакты',
//                       subtitle: 'Выберите из телефонной книги',
//                       onTap: () {
//                         Navigator.pop(context);
//                         ContactBottomSheetDemo();;
//                       },
//                     ),
//                   ],
//
//                   SizedBox(height: 16.h),
//
//                   _buildContactOption(
//                     icon: Icons.person_add_alt_1,
//                     title: 'Добавить новый контакт',
//                     subtitle: 'Создать новый контакт',
//                     onTap: () {
//                       Navigator.pop(context);
//                       // Yangi kontakt qo'shish
//                     },
//                   ),
//                   SizedBox(height: 16.h),
//
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static Widget _buildContactOption({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(16.w),
//         decoration: BoxDecoration(
//           color: Colors.grey[50],
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(color: Colors.grey[200]!),
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(12.w),
//               decoration: BoxDecoration(
//                 color: AppColor.buttonColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: Icon(
//                 icon,
//                 color: AppColor.buttonColor,
//                 size: 24.r,
//               ),
//             ),
//             SizedBox(width: 16.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 4.h),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.grey[400],
//               size: 16.r,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
