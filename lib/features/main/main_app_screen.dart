import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/features/cart/presentation/page/cart_screen.dart';
import 'package:book_ia/features/home/presentation/page/home_screen.dart';
import 'package:book_ia/features/wishlist/presentation/page/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    Center(child: Text('profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.bookmarkSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.bookmarkSvg,
            color: AppColors.primaryColor,
          ),
          label: 'WishList',
        ),

        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.cartSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.cartSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Cart',
        ),

        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profle',
        ),
      ],
    );
  }
}
