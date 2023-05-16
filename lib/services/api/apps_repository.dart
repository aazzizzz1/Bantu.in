import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/services/api/api_services.dart';

import '../../models/post_note_model.dart';
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

  Future<void> postPersonalNote(PostNoteModel note) async {
    try {
      await _apiService.postRequest('/notes', note);
    } catch (_) {
      rethrow;
    }
  }

  Future getPersonalNote() async {
    try {
      final response = await _apiService.getRequest('/notes');
      NoteModel ringtones = NoteModel.fromJson(response);
      // print(response);
      return ringtones.notes;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updatePersonalNote(PostNoteModel note, int id) async {
    try {
      await _apiService.putRequest('/notes/$id', note);
    } catch (_) {
      rethrow;
    }
  }
}
