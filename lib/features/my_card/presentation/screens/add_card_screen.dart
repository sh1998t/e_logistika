import 'package:e_logistika/features/my_card/presentation/screens/pinput_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../core/constants/app_coler.dart';
import '../../../../core/utils/formatters/formatters.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/model/card_model.dart';
import '../widgets/main_text_fielid.dart';

class AddCardScreen extends StatefulWidget {
  static const String name = 'add_card_screen';
  static const String path = '/add_card_screen';

  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController validityController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    validityController.dispose();
    ccvController.dispose();
    cardNameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 10.h,
              bottom: 16.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: AppColor.white,
                  child: Container(
                    alignment: Alignment.center,
                    height: 378.w,
                    width: 343.w,
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 0.h),
                        MainTextField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 16) {
                              return "placeEnterValid";
                            }
                            return null;
                          },
                          title: "cardNumber",
                          inputFormatters: [Formatters.creditCard],

                          keyboardType: TextInputType.number,

                          hintText: '0000 0000 0000 0000',
                          controller: cardNumberController,
                          suffix: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                Assets.svg.qrCode.path,

                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        MainTextField(
                          title: "validityPeriod",

                          keyboardType: TextInputType.number,
                          hintText: "validThru",
                          inputFormatters: [Formatters.expiryDate],
                          controller: validityController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 4) {
                              return "placeEnterValidExpiry";
                            }
                            return null;
                          },
                        ),
                        MainTextField(
                          title: "ccv",

                          keyboardType: TextInputType.number,
                          hintText: '000',
                          inputFormatters: [Formatters.cvv],
                          controller: ccvController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return "pleaseEnterValidCcv";
                            }
                            return null;
                          },
                        ),
                        MainTextField(
                          title:"cardName",

                          keyboardType: TextInputType.text,
                          hintText: "validCardNameText",
                          controller: cardNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "validCardNameText";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 120.h),
                Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "byClickingText",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                        Text("termsOfTheUser",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColors,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                           'agreement',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColors,
                          ),
                        ),
                        Text(
                          "and",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          "thePersonalDataProcessingPolicy",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => PinPutCodeScreen(
                                    card: CreditCard(
                                      cardNumber: cardNumberController.text,
                                      validFrom: validityController.text,
                                      ccv: ccvController.text,
                                      cardHolderFullName:
                                          cardNameController.text,
                                      logoUrl:
                                         Assets.images.card.path,
                                      url:  Assets.images.card1.path,
                                    ),
                                  ),
                            ),
                          );
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
                        'addCard',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 17.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
