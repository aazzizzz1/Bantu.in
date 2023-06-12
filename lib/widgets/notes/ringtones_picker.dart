import 'package:bantuin/models/ringtone_model.dart';
import 'package:bantuin/view_models/ringtone_viewmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';

class RingtonePickerWidget extends StatefulWidget {
  final String label;
  final String? initialRingtone;
  final ValueChanged<String?> onChanged;
  final List<RingtoneDetailModel> listRingtone;

  const RingtonePickerWidget({
    Key? key,
    required this.label,
    this.initialRingtone,
    required this.listRingtone,
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
    // setState(() {
    // });
    _selectedRingtone = ringtone;
    widget.onChanged(ringtone);
  }

  Future<void> _playRingtone(String ringtone) async {
    await FlutterRingtonePlayer.playRingtone();
  }

  @override
  Widget build(BuildContext context) {
    // final listRingtones =
    //     Provider.of<RingtoneViewModel>(context, listen: false).listOfRingtone;
    final List<String> ringtones = [
      'Ringtone is Empty',
      // Add more ringtones here
    ];
    // String selectedValue = '';
    return DropdownButtonFormField(
      value: _selectedRingtone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) {
          return 'Anda belum memilih nada dering';
        }
      },
      items: widget.listRingtone
          .map((item) => DropdownMenuItem<String>(
                value: item.name,
                child: Text(item.name, style: AppFont.regular12),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedRingtone = value as String;
          ringtoneController.text = _selectedRingtone!;
          _onRingtoneSelected(ringtoneController.text);
        });
      },
      // onTap: () => _onRingtoneSelected(ringtoneController.text),
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
