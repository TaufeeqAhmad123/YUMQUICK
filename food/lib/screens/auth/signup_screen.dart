import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../providers/auth_provider.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_login_button.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();
      final success = await authProvider.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (success && mounted) {
        context.go('/home');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowbase,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 750,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        // Header

                        CustomTextField(
                          controller: _emailController,
                          label: 'Full Name',
                          hintText: 'Jhon Dev',
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          label: AppStrings.email,
                          hintText: 'Jhondev@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        CustomTextField(
                          controller: _passwordController,
                          label: AppStrings.password,
                          hintText: '********',
                          obscureText: _obscurePassword,
                          validator: _validatePassword,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.textSecondary,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          label: 'Mobile Number',
                          hintText: '123-456-7890',
                          keyboardType: TextInputType.phone,
                          validator: _validateEmail,
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),

                        CustomTextField(
                          controller: _emailController,
                          label: 'Address',
                          hintText: '123 Main St, City, Country',
                          keyboardType: TextInputType.streetAddress,
                          validator: _validateEmail,
                          prefixIcon: Icons.location_on_outlined,
                        ),
                        const SizedBox(height: 15),

                        RichText(
                          // textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By signing up, you agree to our ',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.font,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.orangeBase,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.font,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.orangeBase,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Login Button
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                            return SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: authProvider.isLoading
                                    ? null
                                    : _handleLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orangeBase,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 0,
                                ),
                                child: authProvider.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : Text(
                                        AppStrings.signup,
                                        style: GoogleFonts.leagueSpartan(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),

                        // Divider
                        const Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.border)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                AppStrings.orContinueWith,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.border)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Social Login Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialLoginButton(
                                icon: AppStrings.facebookIcon,
                                onPressed: () {}),
                            const SizedBox(width: 10),
                            SocialLoginButton(
                                icon: AppStrings.facebookIcon,
                                onPressed: () {}),
                            const SizedBox(width: 10),
                            SocialLoginButton(
                                icon: AppStrings.facebookIcon,
                                onPressed: () {}),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAccount,
                              style: GoogleFonts.leagueSpartan(
                                  color: AppColors.font, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              child: Text(
                                AppStrings.login,
                                style: GoogleFonts.leagueSpartan(
                                    color: AppColors.orangeBase, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), 
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.font,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  'Create account',
                  style: GoogleFonts.leagueSpartan(
                      color: AppColors.font2,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
