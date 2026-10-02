import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/widget/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fun_dev_project/features/profile/presintation/bottom_sheet/change_password_bottom_sheet.dart';
import 'package:fun_dev_project/features/profile/presintation/bottom_sheet/update_user_profile_bottom_sheet.dart';

import '../../../../core/utl/responsive.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';
import '../../../auth/presentation/state/login_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showSearch: true, title: "",showShare: false),
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: responsiveWidth(context, 14),
            right: responsiveWidth(context, 14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: responsiveHeight(context, 18)),
              Text(
                AppLocalizations.of(context)!.settings,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: responsiveHeight(context, 23)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.personalInformation,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return UpdateUserProfileBottomSheet();
                        },
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.change,
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 21)),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  if (loginState is LoginStateSuccess) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: responsiveWidth(context, 20),
                        right: responsiveWidth(context, 20),
                      ),
                      alignment: AlignmentDirectional.centerStart,
                      width: responsiveWidth(context, 375),
                      height: responsiveHeight(context, 64),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 8,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        loginState.authEntity.name ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF9B9B9B),
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  if (loginState is LoginStateSuccess) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: responsiveWidth(context, 20),
                        right: responsiveWidth(context, 20),
                      ),
                      alignment: AlignmentDirectional.centerStart,
                      width: responsiveWidth(context, 375),
                      height: responsiveHeight(context, 64),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 8,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        loginState.authEntity.email ?? "-",
                        style: TextStyle(
                          color: const Color(0xFF9B9B9B),
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: responsiveHeight(context, 55)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return ChangePasswordBottomSheet();
                        },
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.change,
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 18)),
              Container(
                padding: EdgeInsets.only(
                  left: responsiveWidth(context, 20),
                  right: responsiveWidth(context, 20),
                ),
                alignment: AlignmentDirectional.centerStart,
                width: responsiveWidth(context, 375),
                height: responsiveHeight(context, 64),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 8,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.password,
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 11,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '****************',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsiveHeight(context, 55)),
              Text(
                AppLocalizations.of(context)!.notifications,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 16,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: responsiveHeight(context, 23)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.sales,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.newArrivals,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.deliveryStatusChanges,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 68)),
            ],
          ),
        ),
      ),
    );
  }
}
