import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/tracking_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NotesDetail extends StatelessWidget {
  final String title;
  final String description;
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

  NotesDetail({
    required this.title,
    required this.description,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          isPersonal == null
              ? (isAdmin == true
                  ? adminAppbarComponent(context)
                  : detailPersonalClient(isUpload!))
              : const SizedBox()
//           isAdmin != null
          // (isAdmin == true ?  progress&edit : edit)
          // : upload&status
          // isAdmin == null ? adminAppbarComponent(context) : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppFont.textTitleScreen,
                    ),
                    isPersonal == true || isAdmin == true
                        ? buttonEditDelete(context)
                        : const SizedBox(),
                  ],
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 250,
                  child: Text(
                    description,
                    style: AppFont.medium14,
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 24.0),
                isAdmin != null
                    ? (isAdmin == true ? adminWidgetMember() : clientDate())
                    : const SizedBox(),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembuat Catatan :',
                      style: AppFont.medium14,
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(avatarUrl),
                          radius: 12.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          createdBy,
                          style: AppFont.textPersonOrTeam,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                isPersonal == true || isAdmin == true
                    ? adminWidgetDate()
                    : clientUpload(),
                // isAdmin != null
                //     ? (isAdmin == true ? adminWidgetDate() : clientUpload())
                //     : const SizedBox(),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Catatan Diselesaikan")));
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(AppColor.activeColor),
              ),
              child: Center(
                child: Text(
                  'Selesaikan Catatan',
                  style: AppFont.textFillButtonActive,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailPersonalClient(bool isUpload) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        isUpload ? 'Sudah Upload' : 'Belum Upload',
        style: isUpload ? AppFont.textUploadDone : AppFont.textUploadError,
      ),
    );
  }

  Widget buttonEditDelete(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // Navigate to update notes page
            Navigator.pushNamed(
              context,
              '/update-notes',
              arguments: {
                'title': title,
                'description': description,
                'avatarUrl': avatarUrl,
                'name': name,
                'createdBy': createdBy,
                'fileUrl': fileUrl,
                'eventDate': eventDate,
                'reminder': reminder,
                'ringtone': ringtone,
              },
            );
          },
          child: Text(
            'Edit',
            style: AppFont.textButtonActive,
          ),
        ),
        SizedBox(width: 24),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Notes?'),
                  content: Text('Are you sure you want to delete this notes?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform delete operation and navigate back to previous screen
                        // ...
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            'Hapus',
            style: AppFont.textButtonError,
          ),
        ),
      ],
    );
  }

  Widget adminWidgetMember() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColorPrimary.primary3,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20)),
          child: Text('Kak Lea', style: AppFont.textNameTimActive),
        ),
        SizedBox(height: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'File Dokumen : ',
              style: AppFont.medium14,
            ),
            SizedBox(height: 7),
            InkWell(
              onTap: () {},
              child: Text(
                fileUrl,
                style: AppFont.textButtonUnderline,
              ),
            ),
            SizedBox(height: 11),
          ],
        ),
      ],
    );
  }

  Widget adminWidgetDate() {
    return SizedBox(
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal Acara : ' + eventDate,
            style: AppFont.textDescription,
          ),
          Text(
            'Reminder : ' + reminder,
            style: AppFont.textDescription,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Ringtone : ', style: AppFont.textDescription),
                TextSpan(text: ringtone, style: AppFont.textButtonActive),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clientUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload bukti",
          style: AppFont.semiBold14,
        ),
        const SizedBox(height: 8),
        Text(
          " File yang support adalah .jpg atau .png.",
          style: AppFont.medium14,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg', 'pdf', 'doc'],
            );
            if (result != null) {
              PlatformFile file = result.files.first;
              Text(file.name);
              print(file.name);
              print(file.bytes);
              print(file.size);
              print(file.extension);
              print(file.path);
            } else {
              print('Tidak mengambil File');
              // User canceled the picker
            }
          },
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(AppColorNeutral.neutral2),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 10),
            ),
            elevation: MaterialStatePropertyAll(0),
            side: MaterialStatePropertyAll(
                BorderSide(color: AppColorNeutral.neutral2)),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 30,
            child: Text(
              'Upload File',
              style: AppFont.cancelText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget clientDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 1,
          color: AppColorNeutral.neutral2,
        ),
        SizedBox(
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Acara : ' + eventDate,
                style: AppFont.clientTextDate,
              ),
              Text(
                'Reminder : ' + reminder,
                style: AppFont.clientTextDate,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColorNeutral.neutral2,
        ),
      ],
    );
  }

  Widget adminAppbarComponent(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TracingScreen(
                    progress: this.progress == null ? 0 : this.progress!),
              ));
            },
            child: Text(
              "Lihat",
              style: AppFont.textButtonActive,
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AppColor.completeColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: progress == null
                ? Text('0%', style: AppFont.regularprogres12)
                : Text('${(progress! * 100).toStringAsFixed(0)}%',
                    style: AppFont.regularprogres12),
          ),
        ],
      ),
    );
  }
}
