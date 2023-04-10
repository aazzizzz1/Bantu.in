import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

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
    return GestureDetector(
      onTap: () async {
        final List<String> ringtones = [
          'ringtone1.mp3',
          'ringtone2.mp3',
          'ringtone3.mp3',
          // Add more ringtones here
        ];

        await showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(widget.label, style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 16),
                for (final ringtone in ringtones)
                  ListTile(
                    title: Text(ringtone),
                    trailing: Icon(
                      _selectedRingtone == ringtone ? Icons.check_circle : Icons.circle,
                      color: Theme.of(context).accentColor,
                    ),
                    onTap: () {
                      _onRingtoneSelected(ringtone);
                      Navigator.pop(context);
                    },
                    onLongPress: () async {
                      await _playRingtone(ringtone);
                    },
                  ),
              ],
            );
          },
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedRingtone ?? 'Select a ringtone',
              style: TextStyle(
                color: _selectedRingtone == null ? Colors.grey : null,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
