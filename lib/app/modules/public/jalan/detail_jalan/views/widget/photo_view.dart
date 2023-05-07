import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoJalanView extends StatelessWidget {
  const PhotoJalanView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(
          url,
        ),
      ),
    );
  }
}
