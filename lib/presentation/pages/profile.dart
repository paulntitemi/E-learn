import 'package:elearn/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    const double circleRadius = 150.0;
    const double circleBorderWidth = 2.0;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: circleRadius / 2.0),
                child: Container(
                  //replace this Container with your Card
                  height: 500.0,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(8)),
                ),
              ),
              // the image container
              Container(
                width: circleRadius,
                height: circleRadius,
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.all(circleBorderWidth),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
