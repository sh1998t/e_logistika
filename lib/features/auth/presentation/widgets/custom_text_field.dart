import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_coler.dart';

class CustomTextField extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,

    required this.controller,
    required this.hintText,
    required this.inputType,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      cursorColor: AppColor.subtitleTextColor,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          minWidth: 24.r,
          minHeight: 24.r,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 22.r,
          minHeight:22.r,
        ),

        contentPadding: EdgeInsets.only(left: 24.w, top: 8.h, bottom: 8.h),
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        hintStyle:Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColor.grey
        ),
        filled: true,
        fillColor:  AppColor.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:  BorderSide(color: AppColor.white),
        ),
        errorBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColor.red),
        ),
      ),
      validator: widget.validator,
    );
  }
}



