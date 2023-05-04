import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/tim/tim_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TimCardGroup extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String month;
  final String avatarUrl;
  final String name;
  final bool isDone;

  const TimCardGroup({
    required this.title,
    required this.description,
    required this.date,
    required this.month,
    required this.avatarUrl,
    required this.name,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimCardScreen(),
          ),
        );
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Image.asset(
                'lib/assets/images/backtim.png',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(width: 16.0),
            Container(
              padding: EdgeInsets.only(top: 8.0),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFont.semiBold16w500,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                  imageUrl: avatarUrl,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 20.0,
                                  ),
                                ),
                              Positioned(
                                left: 25,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'lib/assets/images/exampleAvatar.png'),
                                  radius: 20,
                                ),
                              ),
                              Positioned(
                                left: 50,
                                child: CachedNetworkImage(
                                  imageUrl: avatarUrl,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ' + 3 Orang',
                          style: AppFont.regular12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
