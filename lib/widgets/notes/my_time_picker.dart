import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimePicker extends StatefulWidget {
  final Function(TimeOfDay)? onChanged;

  const MyTimePicker({Key? key, this.onChanged}) : super(key: key);

  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  String getTimeDifference(TimeOfDay selectedTime) {
    DateTime selectedDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      selectedTime.hour,
      selectedTime.minute,
    );
    Duration difference = DateTime.now().difference(selectedDateTime);
    int hours = difference.inHours;
    return hours == 0
        ? 'sekarang'
        : '${hours.abs()} ${hours.abs() == 1 ? 'jam' : 'jam'} ${hours > 0 ? 'yang lalu' : 'yang akan datang'}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: _selectedTime,
        );
        if (picked != null && picked != _selectedTime) {
          setState(() {
            _selectedTime = picked;
          });
          widget.onChanged?.call(picked);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime.format(context),
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              getTimeDifference(_selectedTime),
              style: TextStyle(
                fontSize: 16.0,
                color: AppColorPrimary.primary6,
              ),
            ),
            // Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
