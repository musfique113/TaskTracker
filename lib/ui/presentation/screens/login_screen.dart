import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/email_verification_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {

  // LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Get Started with",
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
                const SizedBox(
                  height: 15,
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
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailVerificationScreen()));
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,letterSpacing: 0.3),),
                    TextButton(onPressed: () {}, child: const Text("Sign Up"))
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
