import 'package:elearn/data/course/categories.dart';
import 'package:elearn/data/course/leaderboard.dart';
import 'package:elearn/presentation/pages/profile.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/misc.dart';
import 'package:elearn/data/user/user_data.dart';
import 'package:elearn/presentation/widget/subjects_widget.dart';
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
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  // Custom appbar
  PreferredSizeWidget getAppBar() {
    // grow the app bar to fit subject list
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Container(
        // duration: const Duration(milliseconds: 500),
        // curve: Curves.fastOutSlowIn,
        // Appbar container
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Column(
            // Colums conataining the username, profilepic, and the searchbar
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                // user name and searchbar
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hi, ' + user[0]['firstname'],
                      style: const TextStyle(
                          color: black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile()));
                    },
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: white,
                        foregroundImage: AssetImage(user[0]['image']),
                      ),
                    ),
                  )
                ],
              ),
              // search bar
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: shadow),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: white,
                    hintStyle: const TextStyle(color: disabled),
                    hintText: "Search",
                    suffixIcon: const Icon(
                      Icons.search,
                      color: disabled,
                      size: 25,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),

              // tab for leaderboard
              const LeaderBoardTab(),
            ],
          ),
        ),
        // appbar container Decoration
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 10,
              offset: Offset(0, 8),
              spreadRadius: 1, // Shadow position
            ),
          ],
        ),
      ),
    );
  }

  // body widget
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
