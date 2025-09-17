import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_coler.dart';


class ChangePinCodeScreen extends StatefulWidget {
  static const String name = 'changePin_code_screen';
  static const String path = '/changePin_code_screen';
  const ChangePinCodeScreen({super.key});

  @override
  _ChangePinCodeScreenState createState() => _ChangePinCodeScreenState();
}

class _ChangePinCodeScreenState extends State<ChangePinCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool showError = false;
  int currentStep = 1;
  String? currentPin = "1234";
  String? newPin;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _checkPin() {
    if (_codeController.text.length == 4) {
      if (currentStep == 1) {
        if (_codeController.text != currentPin) {
          setState(() {
            showError = true;
            _codeController.clear();
          });
        } else {
          setState(() {
            currentStep = 2;
            _codeController.clear();
            showError = false;
          });
        }
      } else if (currentStep == 2) {
        if (_codeController.text == "1111" || _codeController.text == "1234") {
          setState(() {
            showError = true;
            _codeController.clear();
          });
        } else {
          setState(() {
            newPin = _codeController.text;
            currentStep = 3;
            _codeController.clear();
            showError = false;
          });
        }
      } else if (currentStep == 3) {
        if (_codeController.text != newPin) {
          setState(() {
            showError = true;
            _codeController.clear();
          });
        } else {
          setState(() {
            currentPin = newPin;
            showError = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("pinSuccessfully")),
          );
          Navigator.pop(context);
        }
      }
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
                  if (currentStep == 1) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentStep--;
                      _codeController.clear();
                      showError = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              currentStep == 1
                  ? "enterCurrentPinCode"
                  : currentStep == 2
                  ? "createPinCode"
                  : "repeatPinCode",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
            ),
            SizedBox(height: 8.h),
            if (currentStep == 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      "dontUseSimple",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "1234",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey600,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 30.h),
            if (currentStep == 2)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      "dontUseSimple",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.textLightGray,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "1234",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            if (currentStep == 3) SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Pinput(
                length: 4,
                controller: _codeController,
                animationDuration: Duration.zero,
                onChanged: (value) {
                  setState(() {
                    showError = false;
                  });
                  _checkPin();
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Error";
                  }
                  return null;
                },
                defaultPinTheme: PinTheme(
                  width: 24.w,
                  height: 24.h,
                  textStyle: const TextStyle(fontSize: 0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 24.w,
                  height: 24.h,
                  textStyle: const TextStyle(fontSize: 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                    border: Border.all(color: AppColor.grey, width: 1.w),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 24.w,
                  height: 24.h,
                  textStyle: const TextStyle(fontSize: 0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.amber,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            if (showError)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      currentStep == 1
                          ? "incorrectPinCode"
                          : currentStep == 2
                          ? "aWeakCombination"
                          : "pinDoesNotMatch",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
