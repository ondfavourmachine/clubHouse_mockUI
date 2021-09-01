import 'package:clubhouse_mock/data.dart';
import 'package:clubhouse_mock/widgets/user_profileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope,
              size: 26,
            ),
            onPressed: () => print('Icon'),
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              size: 28,
            ),
            onPressed: () => print('Icon'),
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28,
            ),
            onPressed: () => print('Icon'),
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.add),
          onPressed: () => print('Icon'),
        ),
      ),
      body: Center(
          child: UserProfileImage(
        imageUrl: currentUser.imageUrl,
      )),
    );
  }
}
