import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:elearn/presentation/themes/colors.dart';
import 'package:elearn/utils/player_util.dart';

class CourseView extends StatefulWidget {
  final String title;
  final String image;
  final String desc;
  final double widthvalue;
  final double heightvalue;
  final String videoUrl;
  final List titles;
  const CourseView({
    Key? key,
    required this.title,
    required this.image,
    required this.desc,
    required this.widthvalue,
    required this.heightvalue,
    required this.videoUrl,
    required this.titles,
  }) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late String changingVideoUrl = widget.videoUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: CourseDetail(
                videoUrl: widget.videoUrl,
                titles: widget.titles,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: widget.heightvalue,
          width: widget.widthvalue,
          child: Column(
            children: [
              // image
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.image),
                    ),
                  ),
                ),
              ),
              // short_description
              SizedBox(
                height: 60,
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
