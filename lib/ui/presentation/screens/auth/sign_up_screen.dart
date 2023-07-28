import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  // LoginScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "First Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Mobile",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
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
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
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
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    }, child: const Text("Sign In"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
