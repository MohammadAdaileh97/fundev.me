import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_dev_project/features/fav/presentation/screen/fav_screen.dart';
import 'package:fun_dev_project/features/home/presentation/screen/home_screen.dart';

import '../../../fav/presentation/cubit/fav_item_cubit.dart';
import '../../../home/presentation/cubit/get_ads_cubit.dart';
import '../../../profile/presintation/screen/profile_screen.dart';
import '../../../shop/presentation/cubit/get_categories_cubit.dart';
import '../../../shop/presentation/screen/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ShopScreen(),
    const ProfileScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetAdsCubit>().fetchAds();
    context.read<GetCategoriesCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          _selectedIndex = value;
          if (_selectedIndex == 3) {
            context.read<FavItemCubit>().fetchFavItems();
          }
          setState(() {});
        },
        selectedItemColor: Color(0xFFDB3022),
        unselectedLabelStyle: TextStyle(
          color: const Color(0xFF9B9B9B),
          fontSize: 10,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle: TextStyle(
          color: const Color(0xFFDB3022),
          fontSize: 10,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home_icon/inactive.svg"),
            activeIcon: SvgPicture.asset(
              "assets/images/home_icon/activated.svg",
            ),
            label: AppLocalizations.of(context)!.home,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/shop_icon/inactive.svg"),
            activeIcon: SvgPicture.asset(
              "assets/images/shop_icon/activated.svg",
            ),
            label: AppLocalizations.of(context)!.shop,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/shopping_bag_icon/inactive.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/shopping_bag_icon/activated.svg",
            ),
            label: AppLocalizations.of(context)!.bag,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/heart_icon/inactive.svg"),
            activeIcon: SvgPicture.asset(
              "assets/images/heart_icon/activated.svg",
            ),
            label: AppLocalizations.of(context)!.favorites,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile_icon/inactive.svg"),
            activeIcon: SvgPicture.asset(
              "assets/images/profile_icon/activated.svg",
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
