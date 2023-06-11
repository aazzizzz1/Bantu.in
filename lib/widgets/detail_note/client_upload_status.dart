import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';
import '../../constants/font/app_font.dart';

class ClientUploadStatus extends StatelessWidget {
  final bool isLate;
  final bool isCompleted;
  final bool isUpload;

  const ClientUploadStatus({
    super.key,
    required this.isUpload,
    required this.isCompleted,
    required this.isLate,
  });

  @override
  Widget build(BuildContext context) {
    print(isUpload);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: isUpload
              ? isCompleted
                  ? AppColorPrimary.primary2
                  : AppColor.completeColor
              : AppColor.zeroToHalf,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          isUpload
              ? isCompleted
                  ? 'Catatan Selesai'
                  : 'Sudah Upload'
              : isLate
                  ? 'Anda Telat'
                  : 'Belum Upload',
          style: isUpload
              ? isCompleted
                  ? AppFont.textCompletedNote
                  : AppFont.textUploadDone
              : AppFont.textUploadError,
        ),
      ),
    );
  }
}
