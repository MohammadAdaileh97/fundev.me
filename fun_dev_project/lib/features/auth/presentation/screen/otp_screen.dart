import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fun_dev_project/core/bottom_sheet/msg_bottom_sheet.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';
import 'package:fun_dev_project/core/widget/custom_circular_progress_indicator.dart';
import 'package:fun_dev_project/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:fun_dev_project/features/auth/presentation/screen/update_password_screen.dart';

import '../../../../core/utl/hex_colors.dart';
import '../../../../core/utl/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../state/forgot_password_state.dart';

class OtpScreen extends StatefulWidget {
  final String id;
  final int otp;

  const OtpScreen({super.key, required this.id, required this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool showErrorOtp = false;
  String otpInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              child: Text(
                AppLocalizations.of(context)!.otp,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 87)),
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 16),
                right: responsiveWidth(context, 16),
              ),
              child: Text(
                AppLocalizations.of(context)!.pleaseEnterYourOtp,
                style: TextStyle(
                  color: const Color(0xFF222222),
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),

            OtpTextField(
              numberOfFields: 6,

              showFieldAsBox: true,
              focusedBorderColor: HexColor("#DB3022"),
              onCodeChanged: (String code) {
                otpInput = code;
              },
              onSubmit: (String verificationCode) {
                otpInput = verificationCode;
                if (verificationCode != (widget.otp.toString())) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: AppLocalizations.of(context)!.pleaseEnterValidOtp,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => UpdatePasswordScreen(userId: widget.id),
                    ),
                  );
                }
              }, // end onSubmit
            ),

            SizedBox(height: responsiveHeight(context, 55)),
            CustomButton(
              text: AppLocalizations.of(context)!.send,
              onTap: () {
                if (otpInput != widget.otp.toString()) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MsgBottomSheet(
                        msg: AppLocalizations.of(context)!.pleaseEnterValidOtp,
                        title: AppLocalizations.of(context)!.somethingWentWrong,
                        imagePath: "assets/images/wrong_bottom.svg",
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => UpdatePasswordScreen(userId: widget.id),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
