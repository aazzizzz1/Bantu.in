import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UpdateDateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;
  final DateTime initialDateTime;
  final TextEditingController controller;

  const UpdateDateTimePicker({
    Key? key,
    required this.onChanged,
    required this.initialDateTime,
    required this.controller,
  }) : super(key: key);

  @override
  _UpdateDateTimePickerState createState() => _UpdateDateTimePickerState();
}

class _UpdateDateTimePickerState extends State<UpdateDateTimePicker> {
  late DateTime _selectedDateTime;
  final _dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  _selectDate() async {
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
              content: Text(
                  'Anda tidak dapat memilih waktu sebelum waktu saat ini.'),
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
            // _dateController.text =
            //     DateFormat('EEEE, dd MMM, yyyy').format(_selectedDateTime);
            // _dateController.text =
            //     DateFormat.yMEd('en_US').format(_selectedDateTime);
            widget.controller.text = DateFormat('dd/MM/yyyy hh:mm', 'en_US')
                .format(_selectedDateTime);
          });
          widget.onChanged(_selectedDateTime);
          print(_selectedDateTime);
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
    return TextFormField(
      readOnly: true,
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      style: AppFont.medium14,
      onTap: () {
        initializeDateFormatting('en_US', null).then((_) => _selectDate());
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Anda belum memasukkan tanggal';
        }
      },
      decoration: InputDecoration(
        filled: true,
        hintText: 'mm/dd/yyyy',
        hintStyle: AppFont.hintTextField,
        fillColor: AppColorNeutral.neutral1,
        prefixIcon: Icon(Icons.calendar_month_outlined),
        prefixIconColor: Colors.black,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorNeutral.neutral2)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColorNeutral.neutral2),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorPrimary.primary6)),
      ),
    );
  }
}
