import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/features/profile/presentation/profile/widget/card_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var profileData = SharedPref.getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile', style: AppTextStyle.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(path: AppImages.logeoutSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: profileData?.image ?? '',
                    height: 100,
                    width: 100,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileData?.name ?? '',
                      style: AppTextStyle.subtitle1,
                    ),
                    Text(
                      profileData?.email ?? '',
                      style: AppTextStyle.body.copyWith(
                        color: AppColors.darkgreyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(30),
            CardProfile(text: 'My Orders'),
            Gap(4),
            CardProfile(
              text: 'Edit Profile',
              onTap: () {
                pushTo(context, Routes.editProfile).then((value) {
                  setState(() {});
                });
              },
            ),
            Gap(4),
            CardProfile(
              text: 'Reset Password',
              onTap: () {
                pushTo(context, Routes.updatePassword).then((value) {
                  setState(() {});
                });
              },
            ),
            Gap(4),
            CardProfile(text: 'FAQ'),
            Gap(4),
            CardProfile(text: 'Contact Us'),
            Gap(4),
            CardProfile(text: 'Privacy & Terms'),
          ],
        ),
      ),
    );
  }
}
