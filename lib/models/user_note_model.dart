import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserNotesModel {
  final int id;
  final int userId;
  final int noteId;
  final String role;
  final String reminder;
  final String status;
  final int ringtoneId;
  // final String name;
  // final String fileUrl;
  // final String createdBy;
  // final String ringtone;
  // final double? progress;
  // final bool? isAdmin;
  // final bool? isPersonal;
  // final bool? isUpload;

  UserNotesModel({
    required this.id,
    required this.userId,
    required this.noteId,
    required this.role,
    required this.reminder,
    required this.status,
    required this.ringtoneId,
    // required this.avatarUrl,
    // required this.name,
    // required this.fileUrl,
    // required this.createdBy,
    // required this.eventDate,
    // required this.reminder,
    // required this.ringtone,
    // this.progress,
    // this.isAdmin,
    // this.isPersonal,
    // this.isUpload,
  });

  factory UserNotesModel.fromJson(Map<String, dynamic> json) => UserNotesModel(
        id: json['id'],
        userId: json['user_id'],
        noteId: json['notes_id'],
        role: json['role'],
        reminder: json['reminder'],
        status: json['status'],
        ringtoneId: json['ringtone_id'],
      );
}
