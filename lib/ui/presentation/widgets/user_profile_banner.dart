
import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/53111065?v=4"),
        radius: 15,
      ),
      title: Text(
        "User Name",
        style:
        TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      subtitle: Text(
        "User Email",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 12),
      ),
    );
  }
}
