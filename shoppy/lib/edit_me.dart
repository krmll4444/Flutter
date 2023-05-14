import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shoppy/main.dart';
import 'package:shoppy/me.dart';

class EditMePage extends StatefulWidget {
  const EditMePage({Key? key}) : super(key: key);

  @override
  _EditMePageState createState() => _EditMePageState();
}

class _EditMePageState extends State<EditMePage> {
  final _nameController = TextEditingController();
  File? _picture;

  @override
  void initState() {
    super.initState();
    User? currentUser = FirebaseAuth.instance.currentUser;
    _nameController.text = currentUser?.displayName ?? '';
  }

  Future<void> _uploadPicture() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _picture = File(result.files.single.path!);
      });
    }
  }

  Future<void> _saveAll() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final name = _nameController.text.trim();

    if (_picture != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_avatars')
          .child(currentUser!.uid)
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = storageRef.putFile(_picture!);
      await uploadTask.whenComplete(() {});
      final photoUrl = await storageRef.getDownloadURL();

      await currentUser.updateProfile(displayName: name, photoURL: photoUrl);
    } else {
      await currentUser!.updateProfile(displayName: name);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String userEmail = currentUser?.email ?? 'Unknown';
    String userName = currentUser?.displayName ?? 'Unknown';
    String userPhotoUrl = currentUser?.photoURL ?? '';
    ImageProvider<Object>? avatarImage;

    if (_picture != null) {
      avatarImage = FileImage(_picture!);
    } else {
      avatarImage = NetworkImage(userPhotoUrl);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Me'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                if (userEmail != 'Unknown') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
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
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _uploadPicture,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: avatarImage,
                    child: const Icon(Icons.create),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await _saveAll();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  },
                  child: const Text('Save changes'),
                ),
              ],
            ),
          ),
        ));
  }
}
