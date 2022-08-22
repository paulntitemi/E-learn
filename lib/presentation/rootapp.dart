import 'package:elearn/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
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
      appBar: getAppBar(),
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

// Custom appbar
  PreferredSizeWidget getAppBar() {
    double _h =
        activeTab == 0 ? 300 : 220; // grow the app bar to fit subject list
    return PreferredSize(
      preferredSize: Size.fromHeight(_h),
      child: Container(
        // Appbar container
        height: _h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 70,
          ),
          child: Column(
            // Colums conataining the username, profilepic, and the searchbar
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                // user name and searchbar
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Hi, Akshay!',
                      style: TextStyle(
                          color: black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: disabled,
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
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
              ),
              // temp Sized box
              const SizedBox(
                height: 10,
              ),
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
    return IndexedStack(
      index: activeTab,
      children: const [
        //0
        Center(
          child: Text(
            "Explore",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        //1
        Center(
          child: Text(
            "Planner",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        //2
        Center(
          child: Text(
            "Videos",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        //3
        Center(
          child: Text(
            "LeaderBoard",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
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
    ];
    //used container for custom navbar
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: white,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
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
    );
  }
}
