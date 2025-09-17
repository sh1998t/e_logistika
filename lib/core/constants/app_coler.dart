import 'package:flutter/material.dart';
class AppColor{
  static const ColorScheme customColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primary,
  onPrimary: Colors.white,
  secondary: Colors.white,
  onSecondary: Colors.black,
  error: Colors.red,
  onError: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  );
  static const Color controllerActiveColor = Color(0xFF1656A5);
  static const Color controllerUnActiveColor = Color(0xFF808080);

  static const Color primary = Color(0xFF00A628);

  static const Color fillColor = Color(0xff748014);

  static const Color scaffoldBackground = Color(0xFFF4F5F9);
  static const Color indigo = Color(0xFF5856D6);
  static const Color red = Colors.red;
  static  Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color strongBlue= Color(0xFF185DB2);
  static const Color darkBlue= Color(0xFF0E3C74);
  static const Color grey= Color(0xFF323232);

  static const Color accentOrange = Color(0xffFF7700);
  static  Color accentOrangeOpacity = const Color(0xffFF7700).withValues(alpha: 0.1);
  static const Color subtitleTextColor = Color(0xff7B7B7B);
  static const Color indigoBlueBlack = Color(0xff404E97);
  static const Color lilacMist = Color(0xff9293BA);
  static const Color charcoalBlue = Color(0xff232C38);
  static const Color coolGrey = Color(0xff9293BA);
  static const Color paleSilver = Color(0xffDCDCE3);
  static const Color offWhite = Color(0xffF6F6F6);
  static const Color royalBlue = Color(0xff3445CB);
  static const Color mediumGrey = Color(0xff8D8D8D);
  static const Color  softGrey = Color(0xff999999);
  static const Color  darkCoolGrey = Color(0xff5B5D5F);
  static const Color  vividGreen = Color(0xff08A400);
  static const Color  lightGray = Color(0xffE9E9E9);
  static const Color  paleGray = Color(0xffC0BFBF);
  static  Color  darkEggplant = Color.fromRGBO(51, 34, 51, 0.1);
  static  Color  darkEggplantColor = Color.fromRGBO(51, 34, 51, 0.7);
  static const Color darkGray = Color(0xFF323232);
  static const Color backgroundColor = Color(0xFFEEF1F5);
  static  Color buttonColor = Color(0xFF00FF47).withValues(alpha: 0.25);
  static  Color buttonColor2 = Color(0xFFFAA300).withValues(alpha: 0.25);
  static  Color titleColor = Color(0xFF00BB27);
  static  Color titleColor2 = Color(0xFFFAA300);
  static const Color emptyColor = Color(0xFFE8E8E9);
  static const Color grey4 = Color(0xFF455968);
  static const Color grey1 = Color(0xFFE1ECF6);
  static const Color grey2 = Color(0xFFC7D4DE);
  static const Color grey3 = Color(0xFF92A5B4);
  static const Color inputColor = Color(0xFFF4F9FB);
  static const Color error = Color(0xFFFF0000);
  static const Color green = Color(0xFF49AF26);
  static const Color appbar = Color(0xFF527447);
  static const Color bg = Color(0xFFF0F6F8);
  static const Color placeHolder = Color.fromRGBO(241, 246, 248, 1);
  static const Color primaryBlue = Color(0xFF2F80ED);
  static const Color secondaryColor = Color(0xFFFFD600);
  static const Color greyText = Color(0xFF7D7D7D);
  static const Color transparent = Colors.transparent;
  static Color togleColor = const Color(0xFF740480).withValues(alpha: 0.8);
  static Color sonContainerColor = const Color.fromRGBO(248, 248, 248, 1);
  static Color sonTextContainerColor = const Color.fromRGBO(142, 142, 147, 1);
  static Color checkColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color qrCodeColor = const Color.fromRGBO(56, 70, 105, 1);
  static Color cancelColor = const Color.fromRGBO(116, 116, 128, 0.12);
  static Color logOutColor = const Color.fromRGBO(255, 59, 48, 1);
  static Color toastColor = const Color.fromRGBO(52, 199, 89, 1);
  static Color toastTextColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color payColor = const Color.fromRGBO(0, 191, 252, 1);
  static Color mapModelColor = const Color.fromRGBO(19, 15, 38, 1);
  static Color mapTextColor = const Color.fromRGBO(170, 170, 170, 1);
  static Color mapBorderColor = const Color.fromRGBO(204, 204, 204, 1);
  static Color rentCarButtonColor = const Color.fromRGBO(0, 191, 252, 1);
  static Color rentCarCircleColor = const Color.fromRGBO(63, 109, 203, 1);
  static Color rentCarCircleColor2 = const Color.fromRGBO(194, 216, 232, 1);
  static Color rentCarCommentColor2 = const Color.fromRGBO(126, 126, 126, 1);
  static Color chocolateGrayColor = const Color.fromRGBO(101, 95, 95, 1);
  static Color checksColor = const Color.fromRGBO(52, 199, 89, 1);
  static Color checkTextColor = const Color.fromRGBO(142, 142, 147, 1);

  static const Color textLightGray = Color(0xFF8E8E93);
  static const Color cashTextColor = Color(0xFF151515);
  static const Color devicesButtonColor = Color(0xFFEEEEF0);
  static const Color amber = Colors.amber;
  static const Color containerColor = Color(0xFFF8F8F8);
  static const Color containerColor2 = Color(0xFFEDEDED);
  static const Color payContainerColor = Color(0xFFEFEFF4);
  static Color buttonColorBiometrics = const Color(
    0xFF747480,
  ).withValues(alpha: 0.12);
  static const Color containerColorBiometrics = Color(0xFFFCE000);
  static Color? grey600 = Colors.grey[600];
  static Color? inputColors = const Color(0xFFF8F8F8);
  static Color textColors = const Color(0xFF007AFF);
  static Color sliderActiveColors = const Color(0xFF007AFF);
  static Color sliderColors = const Color(0xFF007AFF).withValues(alpha: 0.3);
  static Color white70 = Colors.white70;
  static Color yourTextInfoColor = const Color(0xFF28313F);
  static Color yourTextColor = const Color(0xFF007AFF);
  static Color yourButtonColor = const Color(
    0xFF747480,
  ).withValues(alpha: 0.12);
  static Color insuranceButtonColor = const Color(0xFFFCE000);
  static Color insuranceActiveColor = const Color(0xFF34C759);
  static Color ticketsCardColor = const Color(0xFF00356D);

  static Color finesContoinerColor = const Color(0xFF34C759);

  static const Color cashColor = Color(0xFF34C759);
  static const Color cashColor1 = Color(0xFFEED23A);
  static const Color cashColor2 = Color(0xFFDC04D3);
  static const Color dividerColor = Color(0xFF8E8E93);
  static const Color dividerColor2 = Color.fromRGBO(216, 234, 233, 1);
  static const Color payDividerColor = Color.fromRGBO(239, 239, 244, 1);
  static const Color rateButtonColor = Color(0xFF00C0FC);
  static const Color stepperActiveColor = Color(0xFF007AFF);
  static const Color residentIdCardButtonColor = Color(0xFF00BFFC);
  static const Color stepperColor = Color(0xFF6E7F90);
  static const Color divider = Color.fromRGBO(41, 41, 41, 1);
  static const Color headerBgColor = Color(0xffF8F8F8);
  static const Color disabledColor = Color(0xffB9B9BA);
  static const Color rentCarNowButtondColor = Color(0xffF6FAFA);

  static const Color successColor = Color(0xff34C759);
  static const Color secondaryBgColor = Color(0xffEFEFF4);
  static const Color linkColor = Color(0xff007AFF);
}