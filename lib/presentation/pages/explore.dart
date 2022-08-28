import 'package:elearn/data/course/course_json.dart';
import 'package:elearn/data/course/categories.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/course_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart' show Feather;

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
        // courses and the category for the explore page
        children: List.generate(exploreCategory.length, (index) {
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
                              exploreCategory[index]['title'],
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
                        widthvalue: 150,
                        heightvalue: 180,
                        image: courses[index]['img'],
                        title: courses[index]['title'],
                        videoUrl: courses[index]['video_url'],
                        titles: courses[index]['topics'],
                        //TODO: Add the author of the course
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
}
