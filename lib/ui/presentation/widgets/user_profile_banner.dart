import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/models/auth_utility.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/auth/sign_in_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/edit_profile_screen.dart';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leading: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const EditProfileScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            radius: 10,
              backgroundImage: NetworkImage(
                AuthUtility.userInfo.data?.photo ?? 'https://avatars.githubusercontent.com/u/53111065?v=4',
              ),
              onBackgroundImageError: (_, __) {
                const Icon(Icons.person_pin);
              },
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
            style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w300),),
          Text(
            AuthUtility.userInfo.data?.email ?? 'Unknown',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await AuthUtility.clearUserInfo();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), (
                  route) => false);
            }
          },
        ),
      ],
    );
  }
}
