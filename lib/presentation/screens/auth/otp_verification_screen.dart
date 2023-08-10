import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/set_password_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/presentation/widgets/screen_background.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  bool _otpVerificationInProgress = false;

  Future<void> verifyOTP() async {
    _otpVerificationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.otpVerify(widget.email, _otpTEController.text));
    _otpVerificationInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      if (mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(
                      email: widget.email,
                      otp: _otpTEController.text,
                    )));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Otp verification has been failed!')));
      }
    }
  }

//   Future<void> verifyOTP() async {
//   _otpVerificationInProgress = true;
//   if (mounted) {
//     setState(() {});
//   }
//
//   final enteredOTP = _otpTEController.text;
//   final NetworkResponse response = await NetworkCaller()
//       .getRequest(Urls.otpVerify(widget.email, enteredOTP));
//
//   _otpVerificationInProgress = false;
//   if (mounted) {
//     setState(() {});
//   }
//
//   if (response.isSuccess) {
//     if (enteredOTP == response.statusCode) {
//       if (mounted) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResetPasswordScreen(
//               email: widget.email,
//               otp: enteredOTP,
//             ),
//           ),
//         );
//       }
//     } else {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Incorrect OTP!')),
//         );
//       }
//     }
//   } else {
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('OTP verification has failed!')),
//       );
//     }
//   }
// }

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
                        //errorAnimationController: errorController,
                        // //controller: textEditingController,
                        // onCompleted: (v) {
                        //   print("Completed");
                        // },
                        // onChanged: (value) {
                        //   print(value);
                        //   // setState(() {
                        //   //   currentText = value;
                        //   // });
                        // },
                        // beforeTextPaste: (text) {
                        //   print("Allowing to paste $text");
                        //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        //   return true;
                        // },
                        appContext: context,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _otpVerificationInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            verifyOTP();
                          },
                          child: const Text('Verify'),
                        ),
                      ),
                    ),
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
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (route) => false);
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
