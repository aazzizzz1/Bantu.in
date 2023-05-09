import 'package:bantuin/screens/tim/tim_add_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constant.dart';

class TimAllMember extends StatefulWidget {
  const TimAllMember({super.key});

  @override
  State<TimAllMember> createState() => _TimAllMemberState();
}

class _TimAllMemberState extends State<TimAllMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        titleSpacing: 15,
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          alignment: Alignment.center,
          splashColor: AppColorNeutral.neutral1,
          splashRadius: 25,
          iconSize: 30,
        ),
        title: Text(
          'Semua anggota',
          style: AppFont.semiBold14,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TimAddMember(),
                ));
              },
              icon: SvgPicture.asset(
                'lib/assets/icons/Add user.svg',
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColorNeutral.neutral2),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'lib/assets/icons/Thrash.svg',
                      color: AppColorRed.red6,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
