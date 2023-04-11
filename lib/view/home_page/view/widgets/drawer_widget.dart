import 'package:chat_app/view/home_page/controller/home_controller.dart';
import 'package:chat_app/view/home_page/view/widgets/custom_listtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade800,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      FirebaseAuth.instance.currentUser!.email!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomListTile(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                // Navigate to home screen
              },
            ),
            CustomListTile(
              icon: Icons.settings,
              text: 'settings',
              onTap: () {
                // Navigate to profile screen
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.white.withOpacity(0.3),
              indent: 16,
              endIndent: 16,
            ),
            CustomListTile(
              icon: Icons.logout,
              text: 'Log out',
              onTap: () {
                provider.signingOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
