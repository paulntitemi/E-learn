import 'package:elearn/data/course/categories.dart';
import 'package:elearn/data/course/leaderboard.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/misc.dart';
import 'package:flutter/material.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({Key? key}) : super(key: key);

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // column for local rankings
          Column(
            children: List.generate(leaderboardCategory.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 15,
                ),
                child: Column(
                  children: [
                    // category name
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, bottom: 5, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // row for design container and category name
                          Expanded(
                            child: Row(
                              children: [
                                // design Container
                                Container(
                                  width: 3,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                // category name
                                Text(
                                  leaderboardCategory[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          // view all chevron
                          const Icon(
                            Icons.chevron_right,
                            color: primary,
                          ),
                        ],
                      ),
                    ),
                    // a little space?
                    const SizedBox(
                      height: 10,
                    ),
                    // courses in category
                    Column(
                      children: List.generate(3, (index) {
                        return LeaderBoardScore(
                          rank: leaders[index]["rank"],
                          score: leaders[index]["score"],
                          username: leaders[index]["username"],
                        );
                      }),
                    ),
                  ],
                ),
              );
            }),
          ),
          // your stats widget
        ],
      ),
    );
  }
}
