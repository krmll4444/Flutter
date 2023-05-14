import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppy/main.dart';
import 'package:shoppy/edit_me.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String userEmail = currentUser?.email ?? 'Unknown';
    String userName = currentUser?.displayName ?? 'Unknown';
    String userPhotoUrl = currentUser?.photoURL ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('About Me'), actions: [
        IconButton(
          icon: const Icon(Icons.create),
          onPressed: () {
            if (userEmail != 'Unknown') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditMePage(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              );
            }
          },
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(userPhotoUrl),
            ),
            const SizedBox(height: 16),
            Text('Logged in as: $userName ($userEmail)'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
