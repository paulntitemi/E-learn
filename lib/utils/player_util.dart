import 'package:elearn/presentation/themes/colors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseDetail extends StatefulWidget {
  final String videoUrl;
  final List titles;
  const CourseDetail({
    Key? key,
    required this.videoUrl,
    required this.titles,
  }) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  // for the changing topics,
  // using -1 as the initial value to avoid initialize error
  late int selected = -1;

  // Flick player utils
  late FlickManager flickManager;
  // Url manager
  late String changingVideoUrl;

  @override
  void initState() {
    super.initState();
    changingVideoUrl = widget.videoUrl;
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(changingVideoUrl),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(),
        body: Column(
          children: [
            // player
            getPlayer(),
            // pdf download
            const SizedBox(
              height: 20,
            ),
            // topics within the course
            getTopics(),
          ],
        ),
      ),
    );
  }

  Widget getPlayer() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: FlickVideoPlayer(flickManager: flickManager),
    );
  }

  Widget getTopics() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: List.generate(
          widget.titles.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  dispose();
                  setState(
                    () {
                      selected = index;
                      changingVideoUrl = widget.titles[index]['video_url'];
                      flickManager = FlickManager(
                        autoInitialize: true,
                        videoPlayerController:
                            VideoPlayerController.asset(changingVideoUrl),
                      );
                      // use a late variable and change it's value on tap
                    },
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // username and rank numner
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // number
                            // a little space
                            const SizedBox(
                              width: 10,
                            ),
                            // username
                            Text(
                              widget.titles[index]['title'],
                              style: const TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: selected == index ? primary : white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: shadow,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                        spreadRadius: 3, // Shadow position
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
