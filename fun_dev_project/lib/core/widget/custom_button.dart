import 'package:flutter/material.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';

import '../utl/hex_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: responsiveWidth(context, 16),
          right: responsiveWidth(context, 16),
        ),
        alignment: Alignment.center,
        width: responsiveWidth(context, 375),
        height: responsiveHeight(context, 48),
        decoration: ShapeDecoration(
          color: HexColor("#DB3022"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
