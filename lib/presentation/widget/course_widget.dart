import 'package:flutter/material.dart';

import 'package:elearn/data/course/course_json.dart';
import 'package:elearn/presentation/themes/colors.dart';

class CourseView extends StatefulWidget {
  // final String title;
  // final String image;
  final String desc;
  const CourseView({
    Key? key,
    // required this.title,
    // required this.image,
    required this.desc,
  }) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 200,
          width: 150,
          child: Column(
            children: [
              // image
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://picsum.photos/250?image=9"),
                    ),
                  ),
                ),
              ),
              // short_description
              SizedBox(
                height: 80,
                child: Text(widget.desc),
              ),
              // watch lecture button
              Container(
                height: 30,
                color: primary,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // watch Icon,
                    Icon(
                      Icons.play_circle_outline_sharp,
                      color: white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Watch Now"),
                  ],
                ),
              ),
            ],
          ),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 3, // Shadow position
              ),
            ],
          ),
        ),
      ),
    );
  }
}
