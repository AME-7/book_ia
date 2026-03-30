import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_back_button.dart';
import 'package:book_ia/features/profile/presentation/update_password/cubit/update_password_cubit.dart';
import 'package:book_ia/features/profile/presentation/update_password/cubit/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdatePasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const CustomBackButton(),
          automaticallyImplyLeading: false,
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                listener: (context, state) {
                  if (state is UpdatePasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password Updated Successfully'),
                      ),
                    );
                    pop(context);
                  } else if (state is UpdatePasswordError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text('Place Your Order', style: AppTextStyle.headline),
                        const Gap(20),

                        TextFormField(
                          controller: oldController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Old Password',
                          ),
                          validator: (v) =>
                              v!.isEmpty ? 'Enter old password' : null,
                        ),

                        const Gap(20),

                        TextFormField(
                          controller: newController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                          ),
                          validator: (v) =>
                              v!.length < 6 ? 'Min 6 chars' : null,
                        ),

                        const Gap(20),

                        TextFormField(
                          controller: confirmController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          validator: (v) => v != newController.text
                              ? 'Passwords do not match'
                              : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
              builder: (context, state) {
                final cubit = context.read<UpdatePasswordCubit>();

                return SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: state is UpdatePasswordLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              cubit.updatePassword(
                                oldPassword: oldController.text,
                                newPassword: newController.text,
                                confirmPassword: confirmController.text,
                              );
                            }
                          },
                    child: state is UpdatePasswordLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Update Password'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
