import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onChanged;

  const TimePicker({Key? key, required this.onChanged}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onChanged(_selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: InputDecorator(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_selectedTime.format(context)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TimePicker extends StatefulWidget {
//   final ValueChanged<TimeOfDay> onChanged;

//   const TimePicker({Key? key, required this.onChanged}) : super(key: key);

//   @override
//   _TimePickerState createState() => _TimePickerState();
// }

// class _TimePickerState extends State<TimePicker> {
//   TimeOfDay _selectedTime = TimeOfDay.now();
//   // Method to format the selected time as a string
//   String _formatTime(TimeOfDay time) {
//     final now = TimeOfDay.now();
//     final timeOfDay = DateTime(DateTime.now().year, DateTime.now().month,
//             DateTime.now().day, time.hour, time.minute)
//         .toLocal();
//     final difference = timeOfDay.difference(DateTime.now().toLocal());
//     final hourDifference = difference.inHours.abs();
//     final minuteDifference = (difference.inMinutes.abs() % 60).toString().padLeft(2, '0');
//     if (hourDifference > 12) {
//       return '${time.format(context)} ($hourDifference hrs $minuteDifference mins from now)';
//     } else if (hourDifference > 0) {
//       return '${time.format(context)} ($hourDifference hrs $minuteDifference mins from now)';
//     } else {
//       return '${time.format(context)} (${time.period == DayPeriod.am ? 'AM' : 'PM'}${difference.inMinutes.abs() > 0 ? ' $minuteDifference mins' : ''} from now)';
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//     );
//     if (picked != null && picked != _selectedTime) {
//       setState(() {
//         _selectedTime = picked;
//       });
//       widget.onChanged(_selectedTime);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _selectTime(context),
//       child: InputDecorator(
//         decoration: const InputDecoration(
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(_formatTime(_selectedTime)),
//             const Icon(Icons.arrow_drop_down),
//           ],
//         ),
//       ),
//     );
//   }
// }
