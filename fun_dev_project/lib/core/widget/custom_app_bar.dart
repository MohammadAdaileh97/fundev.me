import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;
  final bool showShare;
  final String title;

  const CustomAppBar({
    super.key,
    required this.showSearch,
    required this.title,
    required this.showShare,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF222222),
          fontSize: 18,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
      ),

      actions:
          showSearch
              ? [
                InkWell(
                  child: SvgPicture.asset("assets/images/search.svg"),
                  onTap: () {},
                ),
                SizedBox(width: responsiveWidth(context, 14)),
              ]
              : showShare
              ? [
                InkWell(
                  child: SvgPicture.asset("assets/images/share.svg"),
                  onTap: () {},
                ),
                SizedBox(width: responsiveWidth(context, 14)),
              ]
              : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
