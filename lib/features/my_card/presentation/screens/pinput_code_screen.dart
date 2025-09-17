import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_coler.dart';
import '../../data/bloc/add_card_cubit.dart';
import '../../data/bloc/count_down_cubit.dart';
import '../../data/bloc/count_down_state.dart';
import '../../data/model/card_model.dart';

class PinPutCodeScreen extends StatefulWidget {
  final CreditCard? card;
  static const String name = 'inPut_code_screen';
  static const String path = '/inPut_code_screen';
  const PinPutCodeScreen({super.key, this.card});

  @override
  State<PinPutCodeScreen> createState() => _PinPutCodeScreenState();
}

class _PinPutCodeScreenState extends State<PinPutCodeScreen> {
  final TextEditingController pinController = TextEditingController();
  int secondsLeft = 60;
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  bool isLoading = false;
  void showProgressSnackBar(BuildContext context) {
    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (_) {
        return BlocProvider(
          create: (_) => CountdownCubit(),
          child: BlocBuilder<CountdownCubit, CountdownState>(
            builder: (context, state) {
              if (state.isFinished) {
                Future.delayed(Duration.zero, () => entry?.remove());
              }

              return Positioned(
                bottom: 80,
                left: 16,
                right: 16,
                child: Material(
                  color: Colors.transparent,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(seconds: 5),
                    builder: (context, value, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.toastColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "saveChanges",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.toastTextColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 60.w),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: value,
                                    strokeWidth: 2.5,
                                    backgroundColor: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      0.5,
                                    ),
                                    valueColor:
                                    const AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${state.secondsLeft}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    Overlay.of(context).insert(entry);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "addACard",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "confirmation",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              Text(
                "theCodeHasBeenNumber",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textLightGray,
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10.h),
              Pinput(
                onChanged: (value) {},
                length: 6,
                validator: (value) {
                  if (value!.isEmpty && value.length < 6) {
                    return "pleaseEnterTheCode";
                  }
                  return null;
                },
                controller: pinController,
                defaultPinTheme: PinTheme(
                  width: 38.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 38.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 38.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.textColors, width: 1.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<CardCubit>().addCard(widget.card!);
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    });
                    showProgressSnackBar(context);
                  }
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(343.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide.none,
                  backgroundColor: AppColor.containerColorBiometrics,
                ),
                child: Text(
                  "continure",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 17.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              (secondsLeft != 0)
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "requestNewCodeIn",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    formatDuration(secondsLeft),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
                  : OutlinedButton(
                onPressed: () {
                  setState(() {
                    secondsLeft = 60;
                    startTimer();
                  });
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(343.w, 28.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide.none,
                  backgroundColor: const Color(
                    0xFF007AFF,
                  ).withValues(alpha: 0.1),
                ),
                child: Text(
                  "getNewCode",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }
}
