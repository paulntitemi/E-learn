import 'package:flutter/material.dart';

import 'package:elearn/data/course/course_json.dart';
import 'package:elearn/presentation/themes/colors.dart';

class ExploreSubjects extends StatefulWidget {
  const ExploreSubjects({
    Key? key,
  }) : super(key: key);

  @override
  State<ExploreSubjects> createState() => _ExploreSubjectsState();
}

class _ExploreSubjectsState extends State<ExploreSubjects> {
  int activeMenu1 = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10),
        child: Row(
            children: List.generate(subjects.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeMenu1 = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    // the subjects
                    height: 80,
                    width: 80,
                    child: Center(
                      child: Text(
                        subjects[index]['title'],
                        style: TextStyle(
                            fontSize: 15,
                            color: activeMenu1 == index ? primary : disabled,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadow,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          spreadRadius: 3, // Shadow position
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  activeMenu1 == index
                      ? Container(
                          // the indicator
                          width: 40,
                          height: 3,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(5)),
                        )
                      : Container()
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
