import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteModel {
  final String title;
  final String description;
  final String date;
  final String month;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;
  final double? progress;
  final bool? isAdmin;
  final bool? isPersonal;
  final bool? isUpload;

  NoteModel({
    required this.title,
    required this.description,
    required this.date,
    required this.month,
    required this.avatarUrl,
    required this.name,
    required this.fileUrl,
    required this.createdBy,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
    this.progress,
    this.isAdmin,
    this.isPersonal,
    this.isUpload,
  });
}
