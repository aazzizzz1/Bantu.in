import 'package:bantuin/models/ringtone_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RingtoneApi {
  String baseUrl = '';

  Future<RingtoneModel> getRingtone() async {
    Uri url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: ({}),
    );

    final responseBody = json.decode(response.body)['data'];

    final listOfRingtone = RingtoneModel.fromJson(responseBody);

    return listOfRingtone;
  }
}
