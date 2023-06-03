import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/constant.dart';

class ShimmerCardTeam extends StatefulWidget {
  const ShimmerCardTeam({super.key});

  @override
  State<ShimmerCardTeam> createState() => _ShimmerCardTeamState();
}

class _ShimmerCardTeamState extends State<ShimmerCardTeam> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorNeutral.neutral3,
      highlightColor: AppColorNeutral.neutral2,
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
              margin: EdgeInsets.only(left: 16),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(width: 24.0),
            Container(
              padding: EdgeInsets.only(top: 8.0),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 100,
                    color: Colors.green,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
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
