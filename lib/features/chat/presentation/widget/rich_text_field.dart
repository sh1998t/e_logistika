import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_coler.dart';

class RichTextField extends StatelessWidget {
  const RichTextField({
    super.key,
    this.prefix,
    this.inputFormatters,
    this.hintText,
    this.labelText,
    this.style,
    this.width,
    this.height,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.controller,
    this.onchange,
    this.contentPadding,
    this.validator,
    this.title,
    this.textCapitalization,
    this.obscureText = false,
    this.suffix,
    this.isRequired = false, // yangi qo‘shildi
  });

  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? labelText;
  final TextStyle? style;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final TextEditingController? controller;
  final ValueChanged? onchange;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final String? title;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final Widget? suffix;
  final bool isRequired; // majburiy field belgilash

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty ?? false,
          child: RichText(
            text: TextSpan(
              text: title ?? '',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.textLightGray,
              ),
              children: [
                if (isRequired)
                  TextSpan(
                    text: '  *',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onchange,
          validator: validator,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColor.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: AppColor.black,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            prefix: const SizedBox(),
            prefixIcon: prefix,
            suffixIcon: suffix,
            fillColor: AppColor.inputColors,
            hintText: hintText,
            // labelText: labelText,  ❌ buni olib tashlaymiz
            label: labelText != null
                ? RichText(
              text: TextSpan(
                text: labelText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15.sp,
                  color: AppColor.textLightGray,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            )
                : null,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15.sp,
              color: AppColor.textLightGray,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColor.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: Color(0xFF0D6EFD),
                width: 1.5,
              ),
            ),
          ),

        ),
      ],
    );
  }
}
