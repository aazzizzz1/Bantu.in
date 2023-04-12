import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MyReminder extends StatefulWidget {
  final List<DateTime> initialDates;
  final ValueChanged<List<DateTime>> onChanged;

  const MyReminder({
    Key? key,
    required this.initialDates,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MyReminderState createState() => _MyReminderState();
}

class _MyReminderState extends State<MyReminder> {
  List<DateTime> _selectedDates = [];

  @override
  void initState() {
    super.initState();
    _selectedDates = widget.initialDates;
  }

  void _onReminderChanged(DateTime dateTime) {
    setState(() {
      if (_selectedDates.contains(dateTime)) {
        _selectedDates.remove(dateTime);
      } else {
        _selectedDates.add(dateTime);
        _selectedDates.sort();
      }
    });
    widget.onChanged(_selectedDates);
  }

  void _removeReminder(int index) {
    setState(() {
      _selectedDates.removeAt(index);
    });
    widget.onChanged(_selectedDates);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _selectedDates.length + 1,
          itemBuilder: (context, index) {
            if (index == _selectedDates.length) {
              return GestureDetector(
                onTap: () async {
                  final DateTime? selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (selectedDateTime != null) {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      final DateTime selectedDateTimeWithTime = DateTime(
                        selectedDateTime.year,
                        selectedDateTime.month,
                        selectedDateTime.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      _onReminderChanged(selectedDateTimeWithTime);
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  margin:const EdgeInsets.symmetric(vertical: 10, ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "lib/assets/icons/Alarm.svg",
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tambahkan Pengingat',
                          style: AppFont.hintTextField,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "lib/assets/icons/Alarm.svg",
                      height: 26,
                      width: 26,
                    ),
                    Text(DateFormat('dd MMMM yyyy, hh:mm a')
                        .format(_selectedDates[index])),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeReminder(index),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
