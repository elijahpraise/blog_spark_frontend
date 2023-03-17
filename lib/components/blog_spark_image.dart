import 'package:flutter/material.dart';

// enum ImageType {}

class BlogSparkImage extends StatelessWidget {
  const BlogSparkImage(
      {super.key, required this.image, this.height, this.width, this.fit});
  final String image;
  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pictures/$image.png",
      height: height,
      width: width,
      fit: fit,
    );
  }
}
