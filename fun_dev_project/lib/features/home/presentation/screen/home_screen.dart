import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/error_container.dart';
import 'package:fun_dev_project/features/home/presentation/cubit/get_ads_cubit.dart';
import 'package:fun_dev_project/features/home/presentation/state/get_ads_state.dart';
import 'package:fun_dev_project/features/main/presintation/widget/ads_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: responsiveHeight(context, 260),
              child: BlocBuilder<GetAdsCubit, GetAdsState>(
                builder: (context, getAdsState) {
                  if (getAdsState is GetAdsStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (getAdsState is GetAdsStateSuccess) {
                    return CarouselSlider(
                      items:
                          getAdsState.ads.map((e) {
                            return AdsWidget(adsEntity: e);
                          }).toList(),
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (getAdsState is GetAdsStateError) {
                    return ErrorContainer(
                      onTap: () {
                        context.read<GetAdsCubit>().fetchAds();
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
