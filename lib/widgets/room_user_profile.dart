import 'package:clubhouse_mock/widgets/user_profileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;
  const RoomUserProfile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      this.size = 48,
      this.isNew = false,
      this.isMuted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: UserProfileImage(
                imageUrl: imageUrl,
                size: size,
              ),
            ),
            if (isNew)
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '🎉',
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          )
                        ]),
                  )),
            if (isMuted)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.mic_slash_fill),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          )
                        ]),
                  ))
          ],
        ),
        Flexible(child: Text(name, overflow: TextOverflow.ellipsis))
      ],
    );
  }
}
