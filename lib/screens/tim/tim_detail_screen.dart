import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/screens/tim/edit_detail_tim.dart';
import 'package:bantuin/view_models/column_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';

class TimDetailScreen extends StatefulWidget {
  final TeamDetailModel teamDetail;
  const TimDetailScreen({super.key, required this.teamDetail});

  @override
  State<TimDetailScreen> createState() => _TimDetailScreenState();
}

class _TimDetailScreenState extends State<TimDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // Future.microtask(() =>
    // Provider.of<ColumnViewModel>(context, listen: false).fetchColumn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                // placeholder: (context, url) =>
                //     const CircularProgressIndicator(),
                // errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () {},
              child: Text(
                'Ubah Foto Grub',
                style: AppFont.textButtonActive,
              ),
            ),
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Tim',
                  style: AppFont.textTitleScreen,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditDetailTim(teamDetail: widget.teamDetail),
                  )),
                  child: Text(
                    'Ubah',
                    style: AppFont.textButtonActive,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Tim',
                    style: AppFont.textNotificationTime,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.teamDetail.title,
                    style: AppFont.medium14,
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto Latar',
                  style: AppFont.textNotificationTime,
                ),
                const SizedBox(height: 16.0),
                Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://s3-alpha-sig.figma.com/img/e5d9/68a5/edb3551077afa0cdb0e206b26afba2fd?Expires=1685923200&Signature=kRo7H5AiYtGCA8AL5Yeku3dczaf4ZWH3yIQN8GwHDdNpZrPvgKcdgvJ1zOLj507febIfWsudtmMOZ6uoKLfxoKFR8MMIsX5C5FDRTneSb58zfly4VdflZbq65rNblwKK6m6SXbO3Tf9CxeKDMjdemrkibZDBstpwvuegVtePLDrUJMffKlxYPZ6Jx6LUMP4W4kSNMze0eFm7uIAGSdSwusAxj6qDD4TpIqRjBolyzzqpViTqnYE~QxoITWS-VSfd2rYNTRJHG97yMjttaSOMlMvzSysHSt~mnOa2ENHdw9IU4HnOE~bSBDLTqfeC1kmN~2xISwk7RZ413yryee41Xg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                          fit: BoxFit.cover)),
                  child: const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
