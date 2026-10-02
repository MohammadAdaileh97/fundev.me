import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';

import '../../../../core/utl/responsive.dart';
import '../../../../core/widget/custom_circular_progress_indicator.dart';

class ImageWidget extends StatelessWidget {
  final ItemImagesEntity itemImagesEntity;

  const ImageWidget({super.key, required this.itemImagesEntity});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: responsiveWidth(context, 275),
      height: responsiveHeight(context, 413),
      fit: BoxFit.fill,
      imageUrl: itemImagesEntity.imageUrl ?? "",
      progressIndicatorBuilder:
          (context, url, downloadProgress) => CustomCircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
