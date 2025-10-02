import 'package:flutter/material.dart';

class DescriptionInput extends StatefulWidget {
  const DescriptionInput({
    super.key,
    this.hint = 'Pisat…', // yoki: 'Yozing…'
    this.maxLength = 500,
    this.initialText = '',
    this.onChanged,
    this.minLines = 6,
    this.maxLines = 12,
    this.fillColor = const Color(0xFFF3F6FA), // #EEF2F7 yaqin
    this.borderColor = const Color(0xFFDDE3EA),
    this.focusedBorderColor = const Color(0xFF2CA6FF),
    this.radius = 16,
  });

  final String hint;
  final int maxLength;
  final String initialText;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final int maxLines;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final double radius;

  @override
  State<DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<DescriptionInput> {
  late final TextEditingController _c =
  TextEditingController(text: widget.initialText);
  final FocusNode _focus = FocusNode();

  @override
  void dispose() {
    _c.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = _c.text;
    final counter = '${text.characters.length}/${widget.maxLength}';

    return Stack(
      children: [
        TextField(
          controller: _c,
          focusNode: _focus,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          onChanged: (v) {
            setState(() {});         // yangilash uchun
            widget.onChanged?.call(v);
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Color(0xFF9AA3AF)),
            filled: true,
            fillColor: widget.fillColor,
            counterText: '',          // default counterni yashiramiz
            contentPadding:
            const EdgeInsets.fromLTRB(20, 16, 20, 28), // pastda joy qoldir
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide:
              BorderSide(color: widget.focusedBorderColor, width: 1.4),
            ),
          ),
          style: const TextStyle(color: Color(0xFF111827)),
        ),

        Positioned(
          right: 14,
          bottom: 8,
          child: Text(
            counter,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF9AA3AF),
              fontFeatures: [FontFeature.tabularFigures()], // raqamlar toza turadi
            ),
          ),
        ),
      ],
    );
  }
}
