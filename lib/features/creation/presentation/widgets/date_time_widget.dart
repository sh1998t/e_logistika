import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// -------------------------
/// 1) OutlinedValueField
/// -------------------------
class OutlinedValueField extends StatelessWidget {
  final String label;
  final String value;
  final bool requiredMark;
  final VoidCallback? onTap;
  final bool focused;

  const OutlinedValueField({
    super.key,
    required this.label,
    required this.value,
    this.requiredMark = false,
    this.onTap,
    this.focused = true,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);

    return InkWell(
      borderRadius: radius,
      onTap: onTap,
      child: InputDecorator(
        isFocused: focused,
        isEmpty: value.isEmpty,
        decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 2),
              const SizedBox(width: 2),
              Text(label, style: const TextStyle(color: Color(0xFF97A3AF))),
              if (requiredMark)
                const Text(' *', style: TextStyle(color: Colors.red)),
            ],
          ),
          border: OutlineInputBorder(borderRadius: radius),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: const BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: const BorderSide(color: Color(0xFF475467), width: 1.5),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF475467),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


Future<DateTime?> showDateTimePickerDialog(
    BuildContext context, {
      DateTime? initialDateTime,
      DateTime? firstDate,
      DateTime? lastDate,
    }) {
  final init = initialDateTime ?? DateTime.now();
  DateTime selectedDate = DateTime(init.year, init.month, init.day);
  TimeOfDay selectedTime = TimeOfDay(hour: init.hour, minute: init.minute);

  firstDate ??= DateTime(2000);
  lastDate ??= DateTime(2100);

  return showDialog<DateTime>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      int activeTab = 0; // 0=Дата, 1=Время

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: StatefulBuilder(
          builder: (ctx, setState) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420, maxHeight: 640),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderBarContainerTabs(
                    date: selectedDate,
                    time: selectedTime,
                    showBigTime: activeTab == 1,
                    active: activeTab,
                    onChanged: (i) => setState(() => activeTab = i),
                    onOk: () {
                      Navigator.of(ctx).pop(DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      ));
                    },
                    onClose: () => Navigator.of(ctx).pop(),
                  ),
                  // Контент по активной вкладке
                  SizedBox(
                    height: 420,
                    child: activeTab == 0
                        ? Column(
                      children: [
                        _MonthHeader(
                          date: selectedDate,
                          onPrev: () {
                            final prev = DateTime(
                                selectedDate.year, selectedDate.month - 1);
                            selectedDate =
                                DateTime(prev.year, prev.month, 1);
                            setState(() {});
                          },
                          onNext: () {
                            final next = DateTime(
                                selectedDate.year, selectedDate.month + 1);
                            selectedDate =
                                DateTime(next.year, next.month, 1);
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: CalendarDatePicker(
                            initialDate: selectedDate,
                            firstDate: firstDate!,
                            lastDate: lastDate!,
                            onDateChanged: (d) {
                              selectedDate = d;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    )
                        : _TimeWheels(
                      initialHour: selectedTime.hour,
                      initialMinute: selectedTime.minute,
                      onChanged: (h, m) {
                        selectedTime = TimeOfDay(hour: h, minute: m);
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}


class HeaderBarContainerTabs extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final bool showBigTime;
  final int active;
  final ValueChanged<int> onChanged;
  final VoidCallback onOk;
  final VoidCallback onClose;

  const HeaderBarContainerTabs({
    super.key,
    required this.date,
    required this.time,
    required this.showBigTime,
    required this.active,
    required this.onChanged,
    required this.onOk,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1E4BD8);
    const indicatorBlue = Color(0xFF5E7BEF);

    final ru = 'ru';
    final yearStr = DateFormat('yyyy', ru).format(date);
    final dateStr = _ucFirst(DateFormat('EEE, d MMMM', ru).format(date));

    return Container(
      color: Color(0xFF1C3FB7),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 36.h,
                  child: Row(
                    children: [
                      _segBtn(
                        text: 'ДАТА',
                        selected: active == 0,
                        onTap: () => onChanged(0),
                      ),
                      _segBtn(
                        text: 'ВРЕМЯ',
                        selected: active == 1,
                        onTap: () => onChanged(1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

       Padding(padding: EdgeInsets.symmetric(horizontal: 19.w), child:
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,

         children: [
           Text(yearStr,
               style: const TextStyle(color: Color(0xFFC9D3FF), fontSize: 14)),
           Row(
             children: [
               Expanded(
                 child: Text(
                   dateStr,
                   style: const TextStyle(
                     color: Colors.white,
                     fontSize: 20,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               if (showBigTime)
                 RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(
                         text: '${time.hour.toString().padLeft(2, '0')}:',
                         style: const TextStyle(
                             color: Colors.white,
                             fontSize: 28,
                             fontWeight: FontWeight.w700),
                       ),
                       TextSpan(
                         text: time.minute.toString().padLeft(2, '0'),
                         style: const TextStyle(
                             color: Colors.white54,
                             fontSize: 28,
                             fontWeight: FontWeight.w700),
                       ),
                     ],
                   ),
                 ),
               TextButton(
                 onPressed: onOk,
                 style: TextButton.styleFrom(foregroundColor: Colors.white),
                 child: const Text('OK'),
               ),
             ],
           ),
         ],
       ),)
        ],
      ),
    );
  }

  Widget _segBtn({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF5E7BEF) : Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFFE0E7FF),
              fontWeight: FontWeight.w600,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}

// helper



class _MonthHeader extends StatelessWidget {
  final DateTime date;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const _MonthHeader({
    required this.date,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final ru = 'ru';
    final title = DateFormat('LLLL yyyy', ru).format(date);
    return Container(
      color: const Color(0xFFF2F4F7),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrev),
          Expanded(
            child: Text(
              _ucFirst(title),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF1D3A8A),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
        ],
      ),
    );
  }
}

class _TimeWheels extends StatefulWidget {
  final int initialHour;
  final int initialMinute;
  final void Function(int hour, int minute) onChanged;

  const _TimeWheels({
    required this.initialHour,
    required this.initialMinute,
    required this.onChanged,
  });

  @override
  State<_TimeWheels> createState() => _TimeWheelsState();
}

class _TimeWheelsState extends State<_TimeWheels> {
  late FixedExtentScrollController hourCtl;
  late FixedExtentScrollController minCtl;

  int hour = 0;
  int minute = 0;

  @override
  void initState() {
    super.initState();
    hour = widget.initialHour;
    minute = (widget.initialMinute ~/ 5) * 5;
    hourCtl = FixedExtentScrollController(initialItem: hour);
    minCtl = FixedExtentScrollController(initialItem: minute ~/ 5);
  }

  @override
  void dispose() {
    hourCtl.dispose();
    minCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Wheel(
            controller: hourCtl,
            count: 24,
            itemBuilder: (i) =>
                Text(i.toString().padLeft(2, '0'), style: itemStyle),
            onSelectedItemChanged: (i) {
              setState(() => hour = i);
              widget.onChanged(hour, minute);
            },
          ),
          const SizedBox(width: 16),
          const Text(':',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
          const SizedBox(width: 16),
          _Wheel(
            controller: minCtl,
            count: 12, // 0..55 шаг 5
            itemBuilder: (i) =>
                Text((i * 5).toString().padLeft(2, '0'), style: itemStyle),
            onSelectedItemChanged: (i) {
              setState(() => minute = i * 5);
              widget.onChanged(hour, minute);
            },
          ),
        ],
      ),
    );
  }
}

class _Wheel extends StatelessWidget {
  final FixedExtentScrollController controller;
  final int count;
  final Widget Function(int) itemBuilder;
  final ValueChanged<int> onSelectedItemChanged;

  const _Wheel({
    required this.controller,
    required this.count,
    required this.itemBuilder,
    required this.onSelectedItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 88,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 44,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.002,
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (ctx, i) => Center(child: itemBuilder(i!)),
          childCount: count,
        ),
      ),
    );
  }

}

String _ucFirst(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

