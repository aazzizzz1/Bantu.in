import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/constant.dart';

class ShimmerCardWidget extends StatefulWidget {
  const ShimmerCardWidget({super.key});

  @override
  State<ShimmerCardWidget> createState() => _ShimmerCardWidgetState();
}

class _ShimmerCardWidgetState extends State<ShimmerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorNeutral.neutral3,
      highlightColor: AppColorNeutral.neutral2,
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 30,
              color: Colors.green,
              margin: const EdgeInsets.all(8),
            ),
            VerticalDivider(
              width: 5,
              color: Colors.grey[350],
              thickness: 1.5,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            height: 20,
                            width: 50,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 100,
                        color: Colors.green,
                      ),
                    ],
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
