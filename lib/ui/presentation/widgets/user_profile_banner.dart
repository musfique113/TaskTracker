
import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/edit_profile_screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

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
          backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/53111065?v=4"),
          radius: 15,
        ),
        title: Text(
          "User Name",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        subtitle: Text(
          "User Email",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
