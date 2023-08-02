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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the EditProfile page when the button is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfileScreen()),
        );
      },
      child: ListTile(
        tileColor: Colors.green,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(AuthUtility.userInfo.data?.photo ?? ''),
          onBackgroundImageError: (_, __) {
            const Icon(Icons.image);
          },
          radius: 15,
        ),
        title: Text(
          '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        subtitle: Text(
          AuthUtility.userInfo.data?.email ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        trailing: IconButton(
          onPressed: () async {
            await AuthUtility.clearUserInfo();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }
          },
          icon: const Icon(Icons.logout_rounded),
        ),
      ),
    );
  }
}
