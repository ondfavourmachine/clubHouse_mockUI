import 'package:clubhouse_mock/config/Pallete.dart';
import 'package:clubhouse_mock/data.dart';
import 'package:flutter/material.dart';

class UpcomingRooms extends StatelessWidget {
  final List<Room> upcomingRooms;
  const UpcomingRooms({Key? key, required this.upcomingRooms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.),
          color: Pallete.secondaryBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 4, bottom: 4),
        child: Column(
          children: upcomingRooms
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: e.club.isNotEmpty ? 2 : 0),
                          child: Text(e.time),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              e.club.isNotEmpty
                                  ? Flexible(
                                      child: Text(
                                        '${e.club} 🏠'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              Flexible(
                                  child: Text(
                                e.name,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
