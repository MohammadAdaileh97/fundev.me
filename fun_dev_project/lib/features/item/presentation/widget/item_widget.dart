import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/features/fav/presentation/cubit/fav_cubit.dart';
import 'package:fun_dev_project/features/fav/presentation/cubit/fav_item_cubit.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_colors_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_item_images_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_related_items_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_size_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/screen/item_det_screen.dart';

import '../../../../core/widget/custom_circular_progress_indicator.dart';
import '../cubit/get_items_cubit.dart';

class ItemWidget extends StatelessWidget {
  final ItemEntity itemEntity;
  final bool fromFav;

  const ItemWidget({
    super.key,
    required this.itemEntity,
    required this.fromFav,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveHeight(context, 114),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          InkWell(
            onTap: () {
              context.read<GetSizeCubit>().fetchSize();
              context.read<GetColorsCubit>().fetchColors();

              context.read<GetItemImagesCubit>().fetchItemImages(
                idItem: itemEntity.id!,
              );
              context.read<GetRelatedItemsCubit>().fetchRelatedItems(
                idItem: itemEntity.id!,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ItemDetScreen(
                        itemEntity: itemEntity,
                        fromFav: fromFav,
                      ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                start: responsiveWidth(context, 17),
                end: responsiveWidth(context, 17),
                top: responsiveHeight(context, 13),
                bottom: responsiveHeight(context, 13),
              ),
              height: responsiveHeight(context, 104),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 25,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: responsiveHeight(context, 104),
                    height: responsiveHeight(context, 104),
                    fit: BoxFit.fill,
                    imageUrl: itemEntity.imageUrl ?? "",
                    progressIndicatorBuilder: (context, url, progress) {
                      return CustomCircularProgressIndicator();
                    },
                    errorWidget: (context, url, error) {
                      return Icon(Icons.error);
                    },
                  ),
                  SizedBox(width: responsiveWidth(context, 11)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemEntity.name ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: 16,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        itemEntity.categoryName ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF9B9B9B),
                          fontSize: 11,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: double.parse(itemEntity.rate!),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 14,
                            ignoreGestures: true,

                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, index) {
                              return Icon(Icons.star, color: Colors.amber);
                            },
                            onRatingUpdate: (_) {},
                          ),
                          Text(
                            '(${itemEntity.numberRates})',
                            style: TextStyle(
                              color: const Color(0xFF9B9B9B),
                              fontSize: 10,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${itemEntity.price}\$',
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              context.read<FavCubit>().fav(idItem: itemEntity.id!);
              context.read<GetItemsCubit>().changeFav(idItem: itemEntity.id!);
              context.read<GetRelatedItemsCubit>().changeFav(
                idItem: itemEntity.id!,
              );
              context.read<FavItemCubit>().changeFav(idItem: itemEntity.id!);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                end: responsiveWidth(context, 17),
              ),
              width: responsiveHeight(context, 36),
              height: responsiveHeight(context, 36),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child:
                  itemEntity.isFavorite!
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
