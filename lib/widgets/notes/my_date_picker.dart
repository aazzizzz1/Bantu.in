import 'package:bantuin/constants/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final void Function(DateTime selectedDate)? onChanged;

  const MyDatePicker({Key? key, this.onChanged}) : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.blue,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(_selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(_selectedDate);
    final Duration difference = _selectedDate.difference(DateTime.now());
    final int days = difference.inDays;

    final String timeDiff = days == 0
        ? 'hari ini'
        : '${days.abs()} ${days.abs() == 1 ? 'hari' : 'hari'} ${days > 0 ? 'lagi' : 'lalu'}';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatted,
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              timeDiff,
              style: TextStyle(
                  fontSize: 16.0,
                  color: days >= 0 ? AppColorPrimary.primary6 : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
