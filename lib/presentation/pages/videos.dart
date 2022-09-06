import 'package:elearn/data/course/course_json.dart';
import 'package:elearn/data/course/categories.dart';
import 'package:elearn/data/user/user_data.dart';
import 'package:elearn/presentation/pages/profile.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/course_widget.dart';
import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: getBody2(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // courses and the category for the explore page
        children: List.generate(videoCategory.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // category widget
              children: [
                // category name
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 5, top: 2),
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
                              videoCategory[index]['title'],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) {
                      // five items only
                      return CourseView(
                        desc: courses[index]['short_description'],
                        //TODO: Add the author of the course
                        widthvalue: 150,
                        heightvalue: 180,
                        image: courses[index]['img'],
                        title: courses[index]['title'],
                        videoUrl: courses[index]['video_url'],
                        titles: courses[index]['topics'],
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // sliver appbar
  Widget getBody2() {
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 150.0,
        backgroundColor: white,
        elevation: 1,
        // for border radius
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        // greetings and username
        title: Text(
          'Hi, ' + user[0]['firstname'],
          style: const TextStyle(
              color: black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        // profile pic
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
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
        // searchbar and subjects tab
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // get it from behind the title and profile pic
                const SizedBox(height: 20.0),
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
              ],
            ),
          ),
        ),
        // selection tabs
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            // the view
            return Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // category widget
                children: [
                  // category name
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 5, top: 2),
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
                                videoCategory[index]['title'],
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) {
                        // five items only
                        return CourseView(
                          desc: courses[index]['short_description'],
                          //TODO: Add the author of the course
                          widthvalue: 150,
                          heightvalue: 180,
                          image: courses[index]['img'],
                          title: courses[index]['title'],
                          videoUrl: courses[index]['video_url'],
                          titles: courses[index]['topics'],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: videoCategory.length,
        ),
      )
    ]);
  }
}
