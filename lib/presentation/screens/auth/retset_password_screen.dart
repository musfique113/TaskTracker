import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/components/ui_components/form_validator.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/presentation/state_managers/reset_password_controller.dart';
import 'package:taskmanager_ostad/presentation/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email, otp;

  const ResetPasswordScreen({Key? key, required this.email, required this.otp})
      : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Text(
                        'Set Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Minimum password should be 8 letters with numbers & symbols',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _passwordTEController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: _passwordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: FormValidator.validPasswordSignUp,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _confirmPasswordTEController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: !_confirmPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Re-type Password",
                          suffixIcon: IconButton(
                            icon: _confirmPasswordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: FormValidator.validPasswordSignUp,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GetBuilder<ResetPasswordController>(
                          builder: (ResetPasswordController) {
                        return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible:
                                ResetPasswordController.setPasswordInProgress ==
                                    false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                ResetPasswordController.resetPassword(
                                        widget.email,
                                        widget.otp,
                                        _passwordTEController.text)
                                    .then((value) {
                                  if (value) {
                                    Get.snackbar(
                                      'Success',
                                      'Password reset successful!',
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                      borderRadius: 10,
                                    );
                                    Get.offAll(() => const LoginScreen());
                                  } else {
                                    Get.snackbar(
                                      'Failed',
                                      'Reset password has been failed!',
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      borderRadius: 10,
                                    );
                                  }
                                });
                              },
                              child: const Text('Confirm'),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offAll(() => const LoginScreen());
                              },
                              child: const Text('Sign in')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
