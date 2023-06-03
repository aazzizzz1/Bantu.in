import 'package:bantuin/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetail extends StatelessWidget {
  const ShimmerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorNeutral.neutral5,
      highlightColor: AppColorNeutral.neutral2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(width: 8.0),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
