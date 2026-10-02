import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fun_dev_project/core/multiselect/multi_dropdown.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_multi_dropdown.dart';
import 'package:fun_dev_project/core/widget/error_container.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_colors_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_item_images_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_related_items_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/cubit/get_size_cubit.dart';
import 'package:fun_dev_project/features/item/presentation/state/get_color_state.dart';
import 'package:fun_dev_project/features/item/presentation/state/get_size_state.dart';
import 'package:fun_dev_project/features/item/presentation/widget/image_widget.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';

import '../../../../core/widget/custom_circular_progress_indicator.dart';
import '../../../fav/presentation/cubit/fav_cubit.dart';
import '../../../fav/presentation/cubit/fav_item_cubit.dart';
import '../cubit/get_items_cubit.dart';
import '../state/get_item_images_state.dart';
import '../state/get_related_items_state.dart';
import '../widget/item_widget.dart';

class ItemDetScreen extends StatefulWidget {
  final ItemEntity itemEntity;
  final bool fromFav;

  const ItemDetScreen({
    super.key,
    required this.itemEntity,
    required this.fromFav,
  });

  @override
  State<ItemDetScreen> createState() => _ItemDetScreenState();
}

class _ItemDetScreenState extends State<ItemDetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(
        showSearch: false,
        title: widget.itemEntity.name ?? "-",
        showShare: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: responsiveHeight(context, 413),
              child: BlocBuilder<GetItemImagesCubit, GetItemImagesState>(
                builder: (context, getItemImagesState) {
                  if (getItemImagesState is GetItemImagesStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else if (getItemImagesState is GetItemImagesStateSuccess) {
                    return CarouselSlider(
                      items:
                          getItemImagesState.images.map((e) {
                            return ImageWidget(itemImagesEntity: e);
                          }).toList(),
                      options: CarouselOptions(
                        height: responsiveHeight(context, 413),
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (getItemImagesState is GetItemImagesStateError) {
                    return ErrorContainer(
                      onTap: () {
                        context.read<GetItemImagesCubit>().fetchItemImages(
                          idItem: widget.itemEntity.id!,
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),

            SizedBox(height: responsiveHeight(context, 12)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<GetSizeCubit, GetSizeState>(
                    builder: (context, getSizeState) {
                      if (getSizeState is GetSizeStateLoading) {
                        return CustomCircularProgressIndicator();
                      } else if (getSizeState is GetSizeStateSuccess) {
                        return SizedBox(
                          width: responsiveWidth(context, 138),
                          height: responsiveHeight(context, 40),
                          child: CustomMultiDropdown(
                            items:
                                getSizeState.sizes.map((e) {
                                  return DropdownItem(
                                    label: e.name ?? "-",
                                    value: e,
                                  );
                                }).toList(),
                            onSelectionChange: (selectedItems) {},
                            hintText: AppLocalizations.of(context)!.size,
                          ),
                        );
                      } else if (getSizeState is GetSizeStateError) {
                        return ErrorContainer(
                          onTap: () {
                            context.read<GetSizeCubit>().fetchSize();
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  SizedBox(width: responsiveWidth(context, 15)),
                  BlocBuilder<GetColorsCubit, GetColorState>(
                    builder: (context, getColorState) {
                      if (getColorState is GetColorStateLoading) {
                        return CustomCircularProgressIndicator();
                      } else if (getColorState is GetColorStateSuccess) {
                        return SizedBox(
                          width: responsiveWidth(context, 138),
                          height: responsiveHeight(context, 40),
                          child: CustomMultiDropdown(
                            items:
                                getColorState.colors.map((e) {
                                  return DropdownItem(
                                    label: e.name ?? "-",
                                    value: e,
                                  );
                                }).toList(),
                            onSelectionChange: (selectedItems) {},
                            hintText: AppLocalizations.of(context)!.color,
                          ),
                        );
                      } else if (getColorState is GetColorStateError) {
                        return ErrorContainer(
                          onTap: () {
                            context.read<GetColorsCubit>().fetchColors();
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  SizedBox(width: responsiveWidth(context, 15)),
                  InkWell(
                    onTap: () async {
                      await context.read<FavCubit>().fav(
                        idItem: widget.itemEntity.id!,
                      );
                      if (!mounted) return;

                      context.read<GetItemsCubit>().changeFav(
                        idItem: widget.itemEntity.id!,
                      );

                      if (widget.fromFav) {
                        context.read<FavItemCubit>().fetchFavItems();
                        widget.itemEntity.isFavorite =
                            !widget.itemEntity.isFavorite!;
                      }

                      // if (widget.fromFav) {
                      //   if (widget.itemEntity.isFavorite!) {
                      //     context.read<FavItemCubit>().changeFav(
                      //       idItem: widget.itemEntity.id!,
                      //     );
                      //   } else {
                      //     context.read<FavItemCubit>().fetchFavItems();
                      //   }
                      //
                      //   widget.itemEntity.isFavorite =
                      //       widget.itemEntity.isFavorite!;
                      // }

                      setState(() {});
                    },
                    child: Container(
                      width: responsiveWidth(context, 36),
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
                          widget.itemEntity.isFavorite!
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: responsiveHeight(context, 22)),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itemEntity.name ?? '-',
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 24,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$${widget.itemEntity.price}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 24,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Text(
                widget.itemEntity.categoryName ?? "-",
                style: TextStyle(
                  color: const Color(0xFF9B9B9B),
                  fontSize: 11,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: double.parse(widget.itemEntity.rate!),
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
                    '(${widget.itemEntity.numberRates})',
                    style: TextStyle(
                      color: const Color(0xFF9B9B9B),
                      fontSize: 10,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Text(
                widget.itemEntity.description ?? "-",
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),

            Container(
              alignment: Alignment.center,
              height: responsiveHeight(context, 112),
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(0, -4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CustomButton(
                text: AppLocalizations.of(context)!.addToCart,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 13)),
            Divider(height: 0.25),
            SizedBox(height: responsiveHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.shippingInfo,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),

            Divider(height: 0.25),
            SizedBox(height: responsiveHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.support,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            Divider(height: 0.25),
            SizedBox(height: responsiveHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.youCanAlsoLikeThis,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 18,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  BlocBuilder<GetRelatedItemsCubit, GetRelatedItemsState>(
                    builder: (context, getRelatedItemsState) {
                      if (getRelatedItemsState is GetRelatedItemsStateLoading) {
                        return CustomCircularProgressIndicator();
                      } else if (getRelatedItemsState
                          is GetRelatedItemsStateSuccess) {
                        return Text(
                          "${getRelatedItemsState.items.length} ${AppLocalizations.of(context)!.items}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF9B9B9B),
                            fontSize: 11,
                            fontFamily: 'Metropolis',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: BlocBuilder<GetRelatedItemsCubit, GetRelatedItemsState>(
                builder: (context, getRelatedItemsState) {
                  if (getRelatedItemsState is GetRelatedItemsStateLoading) {
                    return CustomCircularProgressIndicator();
                  } else if (getRelatedItemsState
                      is GetRelatedItemsStateSuccess) {
                    return SizedBox(
                      height: responsiveHeight(context, 120),
                      width: responsiveWidth(context, 375),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ItemWidget(
                            fromFav: widget.fromFav,
                            itemEntity: getRelatedItemsState.items[index],
                          );
                        },
                        itemCount: getRelatedItemsState.items.length,
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            SizedBox(height: responsiveHeight(context, 106)),
          ],
        ),
      ),
    );
  }
}
