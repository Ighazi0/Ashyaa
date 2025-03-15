import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final BoxFit? boxFit;
  const NetworkImageWidget({super.key, required this.url, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      errorWidget:
          (context, url, error) => const SizedBox(child: Icon(Icons.error)),
      progressIndicatorBuilder: (context, url, progress) => const SizedBox(),
    );
  }
}
