import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';

class NotesAllMember extends StatelessWidget {
  const NotesAllMember({super.key});

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
          itemCount: 2,
          itemBuilder: (context, index) => Column(
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
                      imageUrl:
                          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=900&t=st=1680684886~exp=1680685486~hmac=b9176641b65dc64df37ed7f0cfba49259ea8908fbe7bd96cecc07b7d42e46633',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 20.0,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Text(
                      'Kak Lea',
                      style: AppFont.semiBold14,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
