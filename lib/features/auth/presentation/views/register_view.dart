import 'package:dalil_syria/features/auth/presentation/providers/auth_provider.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/register_header.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/terms_and_conditions_checkbox.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const RegisterHeader(),
                const SizedBox(height: 30),

                CustomInputField(
                  controller: fullNameController,
                  label: "full_name".tr(),
                  hintText: "John Doe",
                  leadingIcon: Icons.person_outline,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "register_name_required".tr();
                    }

                    if (val.trim().split(" ").length < 2) {
                      return "register_name_invalid".tr();
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomInputField(
                  controller: emailController,
                  label: "login_email".tr(),
                  hintText: "login_email_hint".tr(),
                  leadingIcon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  errorText: authState.error,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "register_email_required".tr();
                    }

                    final emailRegex = RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return "register_email_invalid".tr();
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomInputField(
                  controller: phoneController,
                  label: "phone_namper".tr(),
                  hintText: "+963 xxx xxx xxx",
                  leadingIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "register_phone_required".tr();
                    }

                    if (value.length < 10) {
                      return "register_phone_invalid".tr();
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomInputField(
                  controller: passwordController,
                  label: "login_password".tr(),
                  hintText: "Create a strong password".tr(),
                  leadingIcon: Icons.lock_outline,
                  isPassword: true,
                  trailingIcon: Icons.visibility_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "register_password_required".tr();
                    }

                    if (value.length < 8) {
                      return "register_password_short".tr();
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomInputField(
                  controller: confirmPasswordController,
                  label: "confirm_password".tr(),
                  hintText: "confirm_password".tr(),
                  leadingIcon: Icons.lock_outline,
                  isPassword: true,
                  trailingIcon: Icons.visibility_outlined,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "register_password_not_match".tr();
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                TermsAndConditionsCheckbox(
                  value: acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      acceptTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: authState.isLoading
                        ? null
                        : () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            if (!acceptTerms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("register_accept_terms".tr()),
                                ),
                              );
                              return;
                            }

                            final success = await ref
                                .read(authProvider.notifier)
                                .register(
                                  fullName: fullNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  phone: phoneController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                            if (success && context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D6EFD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: authState.isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "register_create_account".tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ".tr(),
                      style: TextStyle(color: Color(0xFF7D848D)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "login_here".tr(),
                        style: TextStyle(
                          color: Color(0xFF0D6EFD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
