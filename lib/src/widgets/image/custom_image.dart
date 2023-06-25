import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ImageType { file, network }

class CustomImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final ImageType? type;
  const CustomImage({
    Key? key,
    required this.image,
    this.fit,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.type,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: SizedBox(
            height: height,
            width: width,
            child: image.startsWith('assets/')
                ? _ImageAsset(
                    image,
                    height,
                    width,
                    fit,
                    color,
                  )
                : _ImageNetwork(
                    image,
                    height,
                    width,
                    fit,
                    color,
                  ),
          ),
        ),
      );
}

class _ImageAsset extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  const _ImageAsset(this.image, this.height, this.width, this.fit, this.color);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      color: color,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/static/no-image.png',
          fit: fit ?? BoxFit.cover,
        );
      },
    );
  }
}

class _ImageNetwork extends StatelessWidget {
  final String image;

  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  const _ImageNetwork(
    this.image,
    this.height,
    this.width,
    this.fit,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => CustomImage(
        image: 'assets/static/jar-loading.gif',
      ),
      errorWidget: (context, url, error) => CustomImage(
        image: 'assets/static/no-image.png',
        fit: fit ?? BoxFit.cover,
      ),
      fit: fit ?? BoxFit.cover,
    );
  }
}
