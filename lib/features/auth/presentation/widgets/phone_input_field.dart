import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputField extends StatefulWidget {
  final Function(PhoneNumber)? onChanged;
  final String? Function(String?)? validator;

  const PhoneInputField({super.key, this.onChanged, this.validator});

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'UZ');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          if (widget.onChanged != null) {
            widget.onChanged!(number);
          }
        },
        validator: widget.validator,
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN, // Dropdown menyusi
          showFlags: true,
          setSelectorButtonAsPrefixIcon: true,
          useEmoji: true,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        textFieldController: controller,
        formatInput: true,
        keyboardType: TextInputType.phone,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          hintText: '90 123 45 67',
        ),
        initialValue: number,
        countrySelectorScrollControlled:false ,

      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}