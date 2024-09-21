import 'dart:io' show File;

import 'package:flutter/material.dart'
    show
        BlendMode,
        BoxFit,
        BuildContext,
        Builder,
        Center,
        Color,
        ColorFilter,
        IgnorePointer,
        Image,
        Semantics,
        Size,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:flutter_svg/flutter_svg.dart';

import '../loading/custom_shimmer.dart';
import 'image_url.dart' show ImageUrl;
import 'widgets/image_error.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.url,
    this.file,
    this.urlAsset,
    this.imageSize,
    this.asset,
    this.svgAsset,
    this.packageName = 'design_system_qclass',
    this.fit = BoxFit.contain,
    this.enableGestures = false,
    this.imageColor,
  });

  final File? file;
  final BoxFit fit;
  final String? url;
  final String? urlAsset;
  final String? asset;
  final String? svgAsset;
  final Size? imageSize;
  final Color? imageColor;
  final String packageName;
  final bool enableGestures;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize?.width,
      height: imageSize?.height,
      child: IgnorePointer(
        ignoring: !enableGestures,
        child: Builder(
          builder: (_) {
            if (url != null && url!.isNotEmpty) {
              return ImageUrl(
                fit: fit,
                url: url!,
                imageSize: imageSize,
              );
            } else if (urlAsset != null && urlAsset!.isNotEmpty) {
              return Semantics(
                button: true,
                child: SvgPicture.network(
                  urlAsset!,
                  fit: fit,
                  width: imageSize?.width,
                  height: imageSize?.height,
                  colorFilter: (imageColor != null)
                      ? ColorFilter.mode(imageColor!, BlendMode.srcIn)
                      : null,
                  placeholderBuilder: (context) => Center(
                    child: CustomShimmer(
                      width: imageSize?.width ?? 32,
                      height: imageSize?.height ?? 32,
                    ),
                  ),
                ),
              );
            } else if (asset != null && asset!.isNotEmpty) {
              return Semantics(
                button: true,
                child: Image.asset(
                  asset!,
                  fit: fit,
                  width: imageSize?.width,
                  height: imageSize?.height,
                  package: packageName,
                  color: imageColor,
                ),
              );
            } else if (svgAsset != null && svgAsset!.isNotEmpty) {
              return SvgPicture.asset(
                svgAsset!,
                fit: fit,
                width: imageSize?.width,
                height: imageSize?.height,
                package: packageName,
                colorFilter: (imageColor != null)
                    ? ColorFilter.mode(imageColor!, BlendMode.srcIn)
                    : null,
              );
            } else if (file != null) {
              return Semantics(
                button: true,
                child: Image.file(
                  file!,
                  fit: fit,
                  width: imageSize?.width,
                  height: imageSize?.height,
                  color: imageColor,
                  errorBuilder: (context, error, stackTrace) => ImageError(
                    error: error.toString(),
                  ),
                ),
              );
            }
            return const ImageError(error: 'Nenhuma imagem fornecida');
          },
        ),
      ),
    );
  }
}
