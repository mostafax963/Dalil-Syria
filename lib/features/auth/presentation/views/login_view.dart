import 'package:dalil_syria/features/auth/presentation/providers/auth_provider.dart';
import 'package:dalil_syria/features/auth/presentation/views/register_view.dart';
import 'package:dalil_syria/features/booking/presentation/Provider/booking_provider.dart';
import 'package:dalil_syria/features/favorite/presentation/provider/favorites_provider.dart';
import 'package:dalil_syria/features/main/presentation/views/main_view.dart';
import 'package:dalil_syria/features/profile/presentation/provider/profile_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_login_button.dart';
import '../../../../core/shered/widgets/custom_button.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Welcome Back".tr(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sign in to continue exploring Syria".tr(),
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 40),

                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "register_email_required".tr();
                    }

                    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (!regex.hasMatch(value)) {
                      return "register_email_invalid".tr();
                    }

                    return null;
                  },
                  label: "login_email".tr(),
                  hint: "login_email_hint".tr(),
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  errorText: authState.error,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "register_password_required".tr();
                    }

                    if (value.length < 8) {
                      return "register_password_short".tr();
                    }

                    return null;
                  },
                  label: "login_password".tr(),
                  hint: "login_password_hint".tr(),
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,

                  controller: passwordController,
                  errorText: authState.error,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "login_forgot_password".tr(),
                      style: const TextStyle(color: Color(0xFF0D6EFD)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                authState.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: "login_sign_in".tr(),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          final success = await ref
                              .read(authProvider.notifier)
                              .login(
                                emailController.text,
                                passwordController.text,
                              );

                          if (success) {
                            ref.invalidate(profileProvider);
                            ref.invalidate(favoritesProvider);
                            ref.invalidate(bookingsProvider);
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainView(),
                                ),
                              );
                            }
                          }
                        },
                      ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "login_or".tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 30),

                SocialLoginButton(
                  text: "login_facebook".tr(),
                  logoUrl: "images/Facebook.png",
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                SocialLoginButton(
                  text: "login_google".tr(),
                  logoUrl: "images/Google.png",
                  onPressed: () {},
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("login_no_account".tr()),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      child: Text(
                        "login_register".tr(),
                        style: TextStyle(
                          color: Color(0xFF0D6EFD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
