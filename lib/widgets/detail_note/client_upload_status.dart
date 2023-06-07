import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';
import '../../constants/font/app_font.dart';

class ClientUploadStatus extends StatelessWidget {
  final String isUpload;

  const ClientUploadStatus({
    super.key,
    required this.isUpload,
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
          color: isUpload != 'not_upload_yet'
              ? AppColor.completeColor
              : AppColor.zeroColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          isUpload != 'not_upload_yet' ? 'Sudah Upload' : 'Belum Upload',
          style: isUpload != 'not_upload_yet'
              ? AppFont.textUploadDone
              : AppFont.textUploadError,
        ),
      ),
    );
  }
}
