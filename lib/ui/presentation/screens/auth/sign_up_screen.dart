import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  //final TextEditingController _emailTEController = TextEditingController();

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
                    "Join With Us",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 36,
                        letterSpacing: 0.6),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }

                        // Check if the email address is a valid format.
                        final regex = RegExp(
                            r"^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      }
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "First Name",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Mobile",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }

                      // Check if the mobile number is 10 digits long.
                      if (value.length != 11) {
                        return 'Mobile number must be 11 digits long';
                      }

                      // Check if the mobile number starts with a 0,1.
                      if (value[0] != '0' && value[0] != '1') {
                        return 'Mobile number must start with 0 and 1';
                      }

                      // Check if the mobile number is a valid number.
                      try {
                        int.parse(value);
                      } catch (e) {
                        return 'Mobile number must be a valid number';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: _passwordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        // You can add more specific password validation here if needed.
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _userSignUp();
                        },
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
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

  Future<void> _userSignUp() async {
    final response = await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": "",
    });
    if (response.isSuccess) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please correct the errors in the form.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
