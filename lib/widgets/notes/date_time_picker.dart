import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;
  final DateTime initialDateTime;

  const DateTimePicker({
    Key? key,
    required this.onChanged,
    required this.initialDateTime,
  }) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

Future<void> _selectDate() async {
  final DateTime now = DateTime.now();
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: _selectedDateTime,
    firstDate: now,
    lastDate: _selectedDateTime.add(Duration(days: 365)),
  );
  if (selectedDate != null) {
    TimeOfDay initialTime = TimeOfDay.now();
    if (selectedDate == now) {
      initialTime = TimeOfDay.fromDateTime(now);
    }
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime != null) {
      final DateTime selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      if (selectedDateTime.isBefore(now)) {
        // Jika waktu yang dipilih sebelum waktu saat ini, tampilkan pesan kesalahan
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Peringatan'),
            content: Text('Anda tidak dapat memilih waktu sebelum waktu saat ini.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        setState(() {
          _selectedDateTime = selectedDateTime;
        });
        widget.onChanged(_selectedDateTime);
      }
    }
  }
}


  String _getDateTimeDifference() {
    final Duration difference = _selectedDateTime.difference(DateTime.now());
    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? "hari" : "hari"} dari sekarang';
    } else {
      return '${difference.inHours} ${difference.inHours == 1 ? "jam" : "jam"} dari sekarang';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_outlined),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().add_jm().format(_selectedDateTime),
                  style: AppFont.semiBold14
                ),
                Text(
                  _getDateTimeDifference(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
