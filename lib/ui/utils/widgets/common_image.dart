import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  final String imageURL;
  final double? height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? width;
  final bool? setPlaceHolder;
  final String? placeholderImage;
  final BoxFit? boxFit;
  final BoxShape? shape;
  final String? placeholderName;
  final Alignment? alignment;
  final bool _isNetwork;

  const CommonImage.network({
    super.key,
    required this.imageURL,
    this.height,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.width,
    this.setPlaceHolder,
    this.placeholderImage,
    this.boxFit,
    this.shape,
    this.placeholderName,
    this.alignment
  }) : _isNetwork = true;

  const CommonImage.asset({
    super.key,
    required this.imageURL,
    this.height,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.width,
    this.setPlaceHolder,
    this.placeholderImage,
    this.boxFit,
    this.shape,
    this.placeholderName,
    this.alignment
  }) : _isNetwork = false;

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageURL,
        alignment: alignment ?? Alignment.topCenter,
        fit: boxFit,
        placeholder: (context, url) =>
          Center(
            child: CircularProgressIndicator(),
          ),
        errorWidget: (context, url, error) => Icon(Icons.error)
      );
    }
    return Image.asset(
      imageURL,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }
}
