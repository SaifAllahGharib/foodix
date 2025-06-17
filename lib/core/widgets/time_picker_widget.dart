import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../utils/dimensions.dart';
import '../utils/styles.dart';

class TimePickerWidget extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final TimeOfDay? time;

  const TimePickerWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.time,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  String formatTime(BuildContext context, TimeOfDay? time) {
    if (time == null) return context.translate.selectTime;
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Styles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Dimensions.height10),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height12,
                horizontal: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Text(
                formatTime(context, widget.time),
                style: widget.time != null
                    ? Styles.textStyle15(
                        context,
                      ).copyWith(fontWeight: FontWeight.w500)
                    : Styles.textStyle12(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
