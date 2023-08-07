import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/auth/otp_verification_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/screen_background.dart';
import 'package:taskmanager_ostad/ui/ui_components/form_validator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  bool _emailVerficationInProgress = false;

  Future<void> sendOTPTOEmail() async {
    if (_formKey.currentState!.validate()) {
      _emailVerficationInProgress = true;
      if (mounted) {
        setState(() {});
      }
      final NetworkResponse response = await NetworkCaller()
          .getRequest(Urls.sendOtpToEmail(_emailTEController.text.trim()));
      _emailVerficationInProgress = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(
                email: _emailTEController.text.trim(),
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email verification has failed!')),
          );
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  const Text("Your email address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 36,
                          letterSpacing: 0.6)),
                  SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "A 6 digits PIN will sent to your email address",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    validator:FormValidator.validateEmail,
                  ),




                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _emailVerficationInProgress == false,
                      replacement: Center(child: CircularProgressIndicator(),),
                      child: ElevatedButton(
                          onPressed: () {
                           sendOTPTOEmail();
                          },
                          child: const Icon(Icons.arrow_circle_right_outlined)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Sign In"))
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
