import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/screens/tim/tim_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TimCardGroup extends StatelessWidget {
  final TeamDetailModel teamDetail;

  const TimCardGroup({required this.teamDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimCardScreen(
              teamDetail: teamDetail,
            ),
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
                    teamDetail.title,
                    style: AppFont.semiBold16w500,
                    overflow: TextOverflow.ellipsis,
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
                                imageUrl:
                                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
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
                                  imageUrl:
                                      'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
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
