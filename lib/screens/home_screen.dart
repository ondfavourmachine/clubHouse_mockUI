import 'package:clubhouse_mock/data.dart';
import 'package:clubhouse_mock/widgets/room_card.dart';
import 'package:clubhouse_mock/widgets/upcoming_rooms.dart';
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
            GestureDetector(
              onTap: () => print('User profile'),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child:
                    UserProfileImage(imageUrl: currentUser.imageUrl, size: 36),
              ),
            ),
          ],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () => print('Icon'),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              children: [
                UpcomingRooms(upcomingRooms: upcomingRoomsList),
                SizedBox(
                  height: 12,
                ),
                ...roomsList.map((e) => RoomCard(room: e)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(1)
                    ])),
              ),
            ),
            Positioned(
              bottom: 60,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text.rich(
                  TextSpan(children: [
                    WidgetSpan(
                        child: Icon(CupertinoIcons.add,
                            size: 21, color: Colors.white)),
                    TextSpan(
                        text: ' Start a room',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
            ),
            Positioned(
                bottom: 60,
                right: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      onPressed: () => print('pressed'),
                      icon: const Icon(
                        CupertinoIcons.circle_grid_3x3_fill,
                        size: 28,
                      ),
                    ),
                    Positioned(
                      child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle)),
                      right: 4.6,
                      bottom: 11.8,
                    )
                  ],
                ))
          ],
        ));
  }
}
