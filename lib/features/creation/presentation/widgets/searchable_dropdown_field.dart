import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../gen/assets.gen.dart';

class TransportDropdownField extends StatefulWidget {
  const TransportDropdownField({
    super.key,
    this.hint = 'Тип транспорта',
    required this.items,
    this.initialValue,
    this.onChanged,
    this.maxSuggestionHeight = 500,
  });

  final String hint;
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final double maxSuggestionHeight;

  @override
  State<TransportDropdownField> createState() => _TransportDropdownFieldState();
}
class _TransportDropdownFieldState extends State<TransportDropdownField> {
  final TextEditingController _ctl = TextEditingController();
  final FocusNode _focus = FocusNode();

  SearchFieldListItem<String>? _selected;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selected =
          SearchFieldListItem(widget.initialValue!, item: widget.initialValue!);
      _ctl.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _ctl.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _ensureFocus() {
    // FocusNode ulangan bo'lsa darhol, aks holda post-frame’da
    if (_focus.context != null) {
      _focus.requestFocus();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _focus.requestFocus();
      });
    }
  }

  List<SearchFieldListItem<String>> _buildItems(List<String> list) {
    return list.map((e) {
      final isSel = _selected?.item == e;
      return SearchFieldListItem<String>(
        e,
        item: e,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF101828),
                  ),
                ),
              ),
              if (isSel) const Icon(Icons.check_rounded, color: Color(0xFF1E4BD8)),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = _buildItems(widget.items);

    final hasSelection =
        _selected?.item != null && _selected!.item!.isNotEmpty;

    // Xavfsiz fokus tekshiruvi: FocusNode hali ulanmagan bo’lishi mumkin
    final isFocused = _focus.context != null && _focus.hasFocus;

    final Widget suffixIcon = InkWell(
      onTap: () {
        _ensureFocus(); // fokusni xavfsiz beramiz
        _ctl.selection = TextSelection.collapsed(offset: _ctl.text.length);
      },
      child: (hasSelection && !isFocused)
          ? SvgPicture.asset(Assets.svg.arrowBottun.path)
          : SvgPicture.asset(Assets.svg.searchNormal.path),
    );

    return SearchField<String>(
      controller: _ctl,
      focusNode: _focus,                         // muhim
      suggestions: suggestions,
      suggestionState: Suggestion.expand,
      maxSuggestionBoxHeight: widget.maxSuggestionHeight,
      searchInputDecoration: SearchInputDecoration(
        hintText: widget.hint,
        suffix: suffixIcon,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: AppColor.greyColor2.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.transparent, width: 1.5),
        ),
      ),
      suggestionsDecoration:  SuggestionDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [],
      ),
      onSearchTextChanged: (q) {
        if (_selected != null) setState(() => _selected = null);
        final t = q.trim().toLowerCase();
        if (t.isEmpty) return _buildItems(widget.items);
        final filtered =
        widget.items.where((e) => e.toLowerCase().contains(t)).toList();
        return _buildItems(filtered);
      },
      selectedValue: _selected,
      onSuggestionTap: (SearchFieldListItem<String> it) {
        setState(() => _selected = it);
        widget.onChanged?.call(it.item!);
        FocusScope.of(context).unfocus();
      },
    );
  }
}

