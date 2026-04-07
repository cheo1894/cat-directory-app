import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FactTextSkeleton extends StatelessWidget {
  const FactTextSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Text(
        'weouviweuvhoewivhoewivheowivhoweihvoweihvowiehvoiwehvoiwehvoiwehvowe',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
