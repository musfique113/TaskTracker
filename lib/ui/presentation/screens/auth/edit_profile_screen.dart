import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/screen_background.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/user_profile_banner.dart';
import 'package:taskmanager_ostad/ui/ui_components/form_validator.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _passwordVisible = false;
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserProfileBanner(
                isUpdateScreen: true,
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Update Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 30,
                      letterSpacing: 0.6),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        selectImage();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              color: Colors.green,
                              child: const Text(
                                'Photos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Visibility(
                              visible: imageFile != null,
                              child: Text(
                                imageFile?.name ?? '',
                                overflow: TextOverflow.fade,
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: FormValidator.validateEmail,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                      ),
                      validator: FormValidator.validateName,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                      ),
                      validator: FormValidator.validateName,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Mobile",
                      ),
                      validator: FormValidator.validateMobileNumber,
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
                        validator: FormValidator.validPasswordSignUp),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Update'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectImage() {
    picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = xFile;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }
}
