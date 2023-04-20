import 'package:blog_spark/models/user.dart';
import 'package:blog_spark/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});
  Widget _buildInfo(String value) {
    return Text(
      value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, userProvider, Widget? child) {
      User user = userProvider.user ??
          User(
              username: "Guest",
              email: "No emails for a guest account",
              firstname: "Guests");
      return UserAccountsDrawerHeader(
          accountEmail: _buildInfo(user.email!),
          accountName: _buildInfo(user.username!),
          currentAccountPicture: CircleAvatar(
            backgroundImage:
                user.image != null ? NetworkImage(user.image!) : null,
            child: user.image == null
                ? Text(
                    user.firstname!.split("")[0],
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                  )
                : null,
          ));
    });
  }
}
