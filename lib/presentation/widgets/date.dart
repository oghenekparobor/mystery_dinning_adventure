import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';

class PrimaryDatePicker extends StatefulWidget {
  const PrimaryDatePicker({
    required this.dateSelected,
    super.key,
  });

  final Function(DateTime) dateSelected;

  @override
  State<PrimaryDatePicker> createState() => _PrimaryDatePickerState();
}

class _PrimaryDatePickerState extends State<PrimaryDatePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => pickerDate(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        hintText: 'Date of Visit',
      ),
      keyboardType: TextInputType.text,
    );
  }

  void pickerDate() {
    if (Platform.isAndroid) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      ).then((DateTime? value) {
        if (value != null) {
          controller.text = DateFormat.yMMMMEEEEd().format(value);

          widget.dateSelected(value);
        }
      });
    } else {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.w,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () => context.nav.pop(),
                      child: const Text('OK'),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 2.h,
                    thickness: 2.w,
                  ),
                  SizedBox(
                    height: 250.h,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (_) {
                        controller.text = DateFormat.yMMMMEEEEd().format(_);

                        widget.dateSelected(_);
                      },
                      minimumDate: DateTime.now().subtract(
                        const Duration(days: 1),
                      ),
                      maximumDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
