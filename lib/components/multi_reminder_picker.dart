import 'package:bantuin/components/reminder_picker.dart';
import 'package:flutter/material.dart';

class MultiReminderPicker extends StatefulWidget {
  final List<DateTime> initialDates;
  final ValueChanged<List<DateTime>> onChanged;

  const MultiReminderPicker({
    Key? key,
    required this.initialDates,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MultiReminderPickerState createState() => _MultiReminderPickerState();
}

class _MultiReminderPickerState extends State<MultiReminderPicker> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
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
                child: Row(
                  children: [
                    const Icon(Icons.add, size: 24),
                    const SizedBox(width: 8),
                    Text('Add Reminder', style: TextStyle(color: Theme.of(context).accentColor)),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ReminderPicker(
                  initialDate: _selectedDates[index],
                  onChanged: (DateTime dateTime) => _onReminderChanged(dateTime),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
