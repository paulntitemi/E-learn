import 'package:elearn/data/course/categories.dart';
import 'package:elearn/data/course/course_json.dart';
import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/presentation/widget/course_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({Key? key}) : super(key: key);

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
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
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 18,
        ),
        child: Column(
          children: [
            // category 1 name
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
                          plannerCategory[0]['title'],
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
            // category 1 widget
            CourseView(
              desc: plannerCategory[0]["title"],
              widthvalue: MediaQuery.of(context).size.width,
              heightvalue: 220,
              image: courses[0]['img'],
              title: courses[0]['title'],
              videoUrl: courses[0]['video_url'],
              titles: courses[0]['topics'],
              //TODO: Add the author of the course
            ),
            // category 2 name
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
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
                          plannerCategory[1]['title'],
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
            Container(
              child: Row(
                children: [
                  // calendar
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        // calendar options
                        headerVisible: false,
                        shouldFillViewport: false,
                      ),
                    ),
                  ),
                  // event container
                  //TODO: create events data and display it in the calander
                  Container(
                    width: 130,
                    child: Column(),
                    decoration: const BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
