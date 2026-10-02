import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/login_screen.dart';
import 'package:fun_dev_project/features/auth/presentation/state/login_state.dart';
import 'package:fun_dev_project/features/profile/presintation/screen/settings_screen.dart';
import 'package:fun_dev_project/features/take_image/cubit/take_images_cubit.dart';
import 'package:fun_dev_project/features/take_image/dialog/take_image_dialog.dart';

import '../../../take_image/state/take_image_state.dart';
import '../cubit/update_user_image_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "", showSearch: true,showShare: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: responsiveWidth(context, 14),
            right: responsiveWidth(context, 14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.myProfile,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: responsiveHeight(context, 24)),

              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  if (loginState is LoginStateSuccess) {
                    return ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return TakeImageDialog();
                          },
                        );
                      },

                      leading: BlocListener<TakeImagesCubit, TakeImagesState>(
                        listener: (context, takeImagesState) {
                          if (takeImagesState is TakeImagesStateSuccess) {
                            context
                                .read<UpdateUserImageCubit>()
                                .updateUserImage(
                                  file: takeImagesState.images[0],
                                );
                          }
                        },
                        child: BlocBuilder<TakeImagesCubit, TakeImagesState>(
                          builder: (context, takeImageState) {
                            if (takeImageState is TakeImagesStateSuccess) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(69),
                                child: Image.file(
                                  File(takeImageState.images[0].path),
                                  width: 69,
                                  fit: BoxFit.fill,
                                  height: 69,
                                ),
                              );
                            } else {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(69),

                                child: CachedNetworkImage(
                                  width: 69,
                                  fit: BoxFit.fill,
                                  height: 69,
                                  imageUrl:
                                      loginState.authEntity.imageUrl ?? "",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                          ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      title: Text(
                        loginState.authEntity.name ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        loginState.authEntity.email ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF9B9B9B),
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else if (loginState is LoginStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox();
                  }
                },
              ),

              SizedBox(height: responsiveWidth(context, 28)),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.myOrders,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Already have 12 orders',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF9B9B9B),
                  size: 16,
                ),
              ),
              Divider(height: 0.5, color: const Color(0xFF9B9B9B)),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.shippingAddresses,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  '3 ddresses',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF9B9B9B),
                  size: 16,
                ),
              ),

              Divider(height: 0.5, color: const Color(0xFF9B9B9B)),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.paymentMethods,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Visa  **34',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF9B9B9B),
                  size: 16,
                ),
              ),
              Divider(height: 0.5, color: const Color(0xFF9B9B9B)),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.promoCodes,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'You have special promocodes',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF9B9B9B),
                  size: 16,
                ),
              ),
              Divider(height: 0.5, color: const Color(0xFF9B9B9B)),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                title: Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(
                    color: const Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  'Notifications, password',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF9B9B9B),
                  size: 16,
                ),
              ),

              Divider(height: 0.5, color: const Color(0xFF9B9B9B)),

              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LogoutState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListTile(
                      onTap: () async {
                        context.read<LoginCubit>().logout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: 16,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xFF9B9B9B),
                        size: 16,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
