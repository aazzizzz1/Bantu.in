import 'package:bantuin/widgets/notes/date_picker.dart';
import 'package:bantuin/widgets/notes/time_picker.dart';
import 'package:flutter/material.dart';

class ReminderPicker extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;

  const ReminderPicker({Key? key, required this.onChanged, required DateTime initialDate}) : super(key: key);

  @override
  _ReminderPickerState createState() => _ReminderPickerState();
}

class _ReminderPickerState extends State<ReminderPicker> {
  DateTime _selectedDateTime = DateTime.now();

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        _selectedDateTime.hour,
        _selectedDateTime.minute,
      );
    });
    widget.onChanged(_selectedDateTime);
  }

  void _onTimeChanged(TimeOfDay time) {
    setState(() {
      _selectedDateTime = DateTime(
        _selectedDateTime.year,
        _selectedDateTime.month,
        _selectedDateTime.day,
        time.hour,
        time.minute,
      );
    });
    widget.onChanged(_selectedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DatePicker(
          onChanged: _onDateChanged,
        ),
        const SizedBox(height: 16),
        TimePicker(
          onChanged: _onTimeChanged,
        ),
      ],
    );
  }
}
