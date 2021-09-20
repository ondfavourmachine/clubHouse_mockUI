import 'dart:math';

import 'package:clubhouse_mock/data.dart';
import 'package:clubhouse_mock/widgets/room_user_profile.dart';
import 'package:clubhouse_mock/widgets/user_profileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        elevation: 0,
        leading: TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.chevron_down),
            label: Text('All rooms')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.doc,
                color: Colors.black,
                size: 28,
              )),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(CupertinoIcons.ellipsis)),
                    ],
                  ),
                  Text(room.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1))
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: room.speakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Followed by Speakers',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                children: room.followedBySpeakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                children: room.others
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverPadding(padding: const EdgeInsets.only(bottom: 110))
          ],
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          height: 110,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(24)),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: '✌🏽', style: TextStyle(fontSize: 20)),
                      TextSpan(
                          text: 'Leave quietly',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              letterSpacing: 1,
                              fontSize: 16))
                    ])),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          CupertinoIcons.add,
                          size: 30,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          CupertinoIcons.hand_raised,
                          size: 30,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[300]),
                      ),
                    )
                  ],
                )
              ])),
    );
  }
}
