import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../constants/constant.dart';

class RingtonePickerWidget extends StatefulWidget {
  final String label;
  final String? initialRingtone;
  final ValueChanged<String?> onChanged;

  const RingtonePickerWidget({
    Key? key,
    required this.label,
    this.initialRingtone,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RingtonePickerWidgetState createState() => _RingtonePickerWidgetState();
}

class _RingtonePickerWidgetState extends State<RingtonePickerWidget> {
  String? _selectedRingtone;
  final ringtoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedRingtone = widget.initialRingtone;
  }

  void _onRingtoneSelected(String ringtone) {
    setState(() {
      _selectedRingtone = ringtone;
    });
    widget.onChanged(ringtone);
  }

  Future<void> _playRingtone(String ringtone) async {
    await FlutterRingtonePlayer.playRingtone();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> ringtones = [
      'ringtone1.mp3',
      'ringtone2.mp3',
      'ringtone3.mp3',
      // Add more ringtones here
    ];
    // String selectedValue = '';
    return DropdownButtonFormField(
      value: _selectedRingtone,
      validator: (value) {
        if (value == null) {
          return 'Anda belum memilih nada dering';
        }
      },
      items: ringtones
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: AppFont.regular12),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedRingtone = value as String;
          ringtoneController.text = _selectedRingtone!;
        });
      },
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        filled: true,
        hintText: 'Pilih nada dering',
        hintStyle: AppFont.hintTextField,
        fillColor: AppColorNeutral.neutral1,
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
