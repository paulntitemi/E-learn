import 'package:elearn/presentation/pages/explore.dart';
import 'package:elearn/presentation/pages/leaderboard.dart';
import 'package:elearn/presentation/pages/planner.dart';
import 'package:elearn/presentation/pages/videos.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/subjects_widget.dart';
import 'package:flutter/material.dart';
import 'package:elearn/data/user/user_data.dart';
// import 'package:flutter_icons/flutter_icons.dart' show Feather;

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true, // for notch, but makes some elements invisible
      backgroundColor: background,
      // appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
          },
          child: const Icon(Icons.calendar_today) //icon inside button
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center
    );
  }

// Custom appbar (might use sliverappbar for scrolling effects)
  PreferredSizeWidget getAppBar() {
    double _h = 220;
    if (activeTab == 0) {
      _h = 315;
    } else if (activeTab == 3) {
      _h = 270;
    } else {
      _h = 220;
    } // grow the app bar to fit subject list
    return PreferredSize(
      preferredSize: Size.fromHeight(_h),
      child: Container(
        // duration: const Duration(milliseconds: 500),
        // curve: Curves.fastOutSlowIn,
        // Appbar container
        height: _h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 50,
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
                  SizedBox(
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: white,
                      foregroundImage: AssetImage(user[0]['image']),
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
              // subjects for home
              activeTab == 0 ? const ExploreSubjects() : Container(),
              // tab for leaderboard
              activeTab == 3 ? const LeaderBoardTab() : const SizedBox(),
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

//the body/presentation/pages widget
  Widget getBody() {
    return SafeArea(
      bottom: false,
      child: IndexedStack(
        index: activeTab,
        children: const [
          //0
          ExplorePage(),
          //1
          PlannerPage(),
          //2
          VideosPage(),
          //3
          LeaderBoardPage(),
          // //4
          // Center(
          //   child: Text("Chat"),
          // ),
        ],
      ),
    );
  }

  //the bottom navbar widget
  Widget getFooter() {
    //items in navbar icons
    List items = [
      Icons.home_filled,
      Icons.calendar_today,
      Icons.slideshow_rounded,
      Icons.auto_graph_outlined,
      // Icons.messenger_outline,
    ];
    //used container for custom navbar
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: white,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Padding(
        padding: const EdgeInsets.only(
          left: 3,
          right: 3,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            //padding helps even out the items in the nav bar
            return Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(
                    items[index],
                    color: activeTab == index ? primary : disabled,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  }),
            );
          }),
        ),
      ),
    );
  }
}
