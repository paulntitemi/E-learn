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
      bottomNavigationBar: getFooter(),
      body: getBody(),
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

  //the navbar widget
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
      color: Colors.white,
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
                  color:
                      activeTab == index ? Colors.blue.shade600 : Colors.black,
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
