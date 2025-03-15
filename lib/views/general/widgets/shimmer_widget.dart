import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final bool enable;
  final Widget child;
  const ShimmerWidget({super.key, this.enable = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: enable,
      period: Duration(seconds: 2),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: child,
    );
  }
}
