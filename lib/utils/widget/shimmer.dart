import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: DarkCardListSkeleton(
        length: 12,
        isCircularImage: true,
        isBottomLinesActive: true,
      ),
    );
  }
}
