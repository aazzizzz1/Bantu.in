import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class NotesAllMember extends StatelessWidget {
  final List member;
  const NotesAllMember({super.key, required this.member});

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
          'Semua orang',
          style: AppFont.semiBold14,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: member.length,
            itemBuilder: (context, index) {
              var data = member[index];
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColorNeutral.neutral2),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: data.photo,
                          // placeholder: (context, url) =>
                          //     const CircularProgressIndicator(),
                          // errorWidget: (context, url, error) =>
                          //     const Icon(Icons.error),
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 20.0,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          data.username,
                          style: AppFont.semiBold14,
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
