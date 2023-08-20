import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/components/ui_components/form_validator.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/email_verification_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/sign_up_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:taskmanager_ostad/presentation/state_managers/login_controller.dart';
import 'package:taskmanager_ostad/presentation/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _passwordVisible = false;

  //final SignInController  siginInController = Get.put<SignInController> (SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get Started with",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 36,
                        letterSpacing: 0.6),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: FormValidator.validateEmail),
                  const SizedBox(
                    height: 15,
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
                      validator: FormValidator.validPasswordLogin),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<SignInController>(builder: (SignInController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: SignInController.signInProgress == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              SignInController.logIn(
                                      _emailTEController.text.trim(),
                                      _passwordTEController.text)
                                  .then((result) {
                                if (result == true) {
                                  Get.offAll(const BottomNavbarScreen());
                                } else {
                                  Get.snackbar("Failed", "Login Failed");
                                }
                              });
                            },
                            child: const Icon(Icons.arrow_forward_ios)),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Get.to(const EmailVerificationScreen());
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(const SignUpScreen());
                          },
                          child: const Text("Sign Up"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
