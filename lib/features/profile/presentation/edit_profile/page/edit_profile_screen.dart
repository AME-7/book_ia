import 'dart:io';

import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/functions/validations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/custom_text_form_field.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/profile/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:book_ia/features/profile/presentation/edit_profile/cubit/edit_profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String path = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccese) {
          pop(context);
          pop(context);
        } else if (state is EditProfileError) {
          pop(context);
          showMyDialog(context, 'Failed to update profile. please try again');
          // ignore: avoid_print
          return print(Error());
        } else if (state is EditProfileLoading) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<EditProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: CustomSvgPicture(path: AppImages.backSvg),
                  ),
                ),
                Text('Edit Profile'),
              ],
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Stack(
                  children: [
                    if (path.isNotEmpty)
                      ClipOval(
                        child: Image.file(
                          File(path),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isNotEmpty)
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: cubit.imageUrl,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 100,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isEmpty)
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.accentColor,

                        child: CustomSvgPicture(
                          path: AppImages.profileSvg,
                          color: AppColors.primaryColor,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,

                      child: GestureDetector(
                        onTap: () async {
                          pickProfileImage();
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.backgroundColor,
                          child: CustomSvgPicture(path: AppImages.cameraSvg),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(54),
                CustomTextFormField(
                  controller: cubit.nameController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Plass enter your name';
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextFormField(
                  controller: cubit.phoneController,
                  hintText: 'phone',
                  keybordType: TextInputType.phone,

                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty == true &&
                        !isEgyptionPhone(value)) {
                      return 'Plass enter a valid Egyption phone';
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextFormField(
                  controller: cubit.addressController,
                  hintText: 'Address',
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: MainButton(
              text: 'Update Profile',
              onPressed: () {
                cubit.updateProfile(File(path));
              },
            ),
          ),
        );
      },
    );
  }

  void pickProfileImage() async {
    var picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
