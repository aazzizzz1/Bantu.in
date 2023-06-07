import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';

class NotesAllFile extends StatelessWidget {
  final List file;
  const NotesAllFile({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPrimary.primary1,
      appBar: AppBar(
        toolbarHeight: 76,
        titleSpacing: 15,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Semua dokumen',
          style: AppFont.semiBold14,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: file.length,
            itemBuilder: (context, index) {
              final data = file[index];
              return Column(
                children: [
                  Container(
                    height: 64,
                    margin: const EdgeInsets.only(bottom: 12.0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.note_add_outlined,
                          color: AppColorPrimary.primary6,
                        ),
                        const SizedBox(width: 18),
                        SizedBox(
                          width: 280,
                          child: Text(
                            data.substring(data.lastIndexOf("/") + 1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppFont.semiBold14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
