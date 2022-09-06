import 'package:elearn/data/user/profile_data.dart';
import 'package:elearn/data/user/user_data.dart';
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
    late List ptitles;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
        child: Column(
          children: [
            // top box with user image and other details
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: circleRadius / 2.0),
                  child: Container(
                    //TODO: Add user personal data like email and id
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                // the image container
                Container(
                  width: circleRadius,
                  height: circleRadius,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(), color: shadow),
                  child: Padding(
                    padding: const EdgeInsets.all(circleBorderWidth),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(user[0]['image']),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // bottom container with options for the profile
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: List.generate(
                    preferences.length,
                    (index) {
                      return Column(
                        children: [
                          // category title
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, bottom: 8, top: 12),
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      // category name
                                      Text(
                                        preferences[index]['category_title'],
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
                          // items in category
                          Column(
                            children: List.generate(
                              preferences[index]['options'].length,
                              // renamed index to ind to get proper values
                              (ind) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // row for design container and category name
                                          Expanded(
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                // category name
                                                Text(
                                                  preferences[index]['options']
                                                          [ind][
                                                      'title'], // get the title using multiple for loop
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
