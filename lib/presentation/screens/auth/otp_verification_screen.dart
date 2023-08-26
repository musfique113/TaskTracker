import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/retset_password_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/presentation/state_managers/otp_verfication_controller.dart';
import 'package:taskmanager_ostad/presentation/widgets/screen_background.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;

  OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Text(
                      'OTP Verification',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'A 6 digits pin will sent to your email address',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 60,
                      child: PinCodeTextField(
                        controller: _otpTEController,
                        keyboardType: TextInputType.number,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          inactiveFillColor: Colors.white,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.red,
                          activeColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: Colors.green,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        cursorColor: Colors.green,
                        enableActiveFill: true,
                        appContext: context,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<OtpVerificationController>(
                        builder: (OtpVerificationController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: OtpVerificationController
                                  .otpVerificationInProgress ==
                              false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              OtpVerificationController.verifyOTP(
                                email,
                                _otpTEController.text,
                              ).then((value) {
                                if (value) {
                                  Get.snackbar(
                                    'Success',
                                    'Otp verification success!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                  Get.to(() => ResetPasswordScreen(
                                        email: email,
                                        otp: _otpTEController.text,
                                      ));
                                } else {
                                  Get.snackbar(
                                    'Failed',
                                    'Otp verification has been failed!',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                }
                              });
                            },
                            child: const Text('Verify'),
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
                              fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.off(const LoginScreen());
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
    );
  }
}
