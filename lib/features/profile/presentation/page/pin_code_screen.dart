import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';

class ChangePinCodeScreen extends StatefulWidget {
  static const String name = 'changePin_code_screen';
  static const String path = '/changePin_code_screen';

  const ChangePinCodeScreen({super.key});

  @override
  _ChangePinCodeScreenState createState() => _ChangePinCodeScreenState();
}

class _ChangePinCodeScreenState extends State<ChangePinCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  String currentPin = "1234"; // demo uchun eski pin
  String? newPin;

  int step = 1; // 1=eski pin, 2= yangi pin, 3= tasdiqlash

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _checkPin() {
    if (_codeController.text.length == 4) {
      if (step == 1) {
        if (_codeController.text != currentPin) {
          _showError("Неверный PIN-код. Попробуйте снова");
        } else {
          setState(() {
            step = 2;
            _codeController.clear();
          });
        }
      } else if (step == 2) {
        newPin = _codeController.text;
        setState(() {
          step = 3;
          _codeController.clear();
        });
      } else if (step == 3) {
        if (_codeController.text != newPin) {
          _showError("PIN-коды не совпадают. Попробуйте снова");
          setState(() {
            step = 2; // qayta yangi PIN kiritish
            _codeController.clear();
          });
        } else {
          setState(() {
            currentPin = newPin!;
          });
          CherryToast.success(
            backgroundColor: const Color(0xFF34C759),
            iconWidget: SvgPicture.asset(Assets.svg.error.path),
            title: Text("Успех", style: TextStyle(color: AppColor.white)),
            description: Text("PIN-код успешно изменен", style: TextStyle(color: AppColor.white)),
            animationType: AnimationType.fromTop,
            autoDismiss: true,
            toastDuration: const Duration(seconds: 3),
          ).show(context);
          Navigator.pop(context);
        }
      }
    }
  }

  void _showError(String message) {
    _codeController.clear();
    CherryToast.error(
      backgroundColor: Colors.red,
      title: Text("Ошибка", style: TextStyle(color: AppColor.white)),
      description: Text(message, style: TextStyle(color: AppColor.white)),
      animationType: AnimationType.fromTop,
      autoDismiss: true,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  String _getTitle() {
    switch (step) {
      case 1:
        return "Введите старый PIN-код";
      case 2:
        return "Придумайте новый PIN-код";
      case 3:
        return "Повторите новый PIN-код";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                onPressed: () {
                  if (step == 1) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      step--;
                      _codeController.clear();
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              _getTitle(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
            ),
            SizedBox(height: 30.h),
            Pinput(
              length: 4,
              controller: _codeController,
              animationDuration: Duration.zero,
              onChanged: (value) => _checkPin(),
              defaultPinTheme: PinTheme(
                width: 12.w,
                height: 12.h,
                textStyle: const TextStyle(fontSize: 0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 12.w,
                height: 12.h,
                textStyle: const TextStyle(fontSize: 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  border: Border.all(color: AppColor.grey, width: 1.w),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 12.r,
                height: 12.r,
                textStyle: const TextStyle(fontSize: 0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF185FAF),
                      Color(0xFF104280),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
