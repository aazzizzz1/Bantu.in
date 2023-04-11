import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/font/app_font.dart';

class ClientUploadStatus extends StatelessWidget {
  final bool isUpload;

  const ClientUploadStatus({
    super.key,
    required this.isUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        isUpload ? 'Sudah Upload' : 'Belum Upload',
        style: isUpload ? AppFont.textUploadDone : AppFont.textUploadError,
      ),
    );
  }
}
