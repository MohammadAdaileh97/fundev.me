import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';

class AdsWidget extends StatelessWidget {
  final AdsEntity adsEntity;

  const AdsWidget({super.key, required this.adsEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          width: responsiveWidth(context, 375),
          height: responsiveHeight(context, 260),
          fit: BoxFit.fill,
          imageUrl: adsEntity.imageUrl ?? "",
          progressIndicatorBuilder:
              (context, url, downloadProgress) =>
                  CustomCircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(
          adsEntity.title ?? "-",
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
