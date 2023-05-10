import 'package:bantuin/services/api/api_services.dart';

import '../../models/ringtone_model.dart';

class AppsRepository {
  final _apiService = ApiServices();

  Future<List<RingtoneDetailModel>> fetchRingtone() async {
    try {
      final response = await _apiService.getRequest('/ringtones');

      RingtoneModel ringtones = RingtoneModel.fromJson(response);

      return ringtones.ringtones;
    } catch (_) {
      rethrow;
    }
  }
}
