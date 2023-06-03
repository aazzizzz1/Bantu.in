import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;
  const ShimmerContainer.rectangle(
      {super.key, required this.height, required this.width})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerContainer.circular({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorNeutral.neutral3,
      highlightColor: AppColorNeutral.neutral2,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: AppColorNeutral.neutral3,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
