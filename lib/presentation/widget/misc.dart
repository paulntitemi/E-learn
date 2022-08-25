import 'package:elearn/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

class LeaderBoardScore extends StatelessWidget {
  final String rank;
  final String username;
  final String score;
  const LeaderBoardScore({
    Key? key,
    required this.rank,
    required this.username,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color finalColor = white;
    if (rank == "1") {
      finalColor = gold;
    } else if (rank == "2") {
      finalColor = silver;
    } else if (rank == "3") {
      finalColor = bronze;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  // rank
                  Text(
                    rank,
                    style: const TextStyle(
                      fontSize: 20,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // a little space
                  const SizedBox(
                    width: 10,
                  ),
                  // username
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 20,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // score designer
              Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                      ),
                      Text(
                        score,
                        style: const TextStyle(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: finalColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ],
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
    );
  }
}

class ReminderBar extends StatelessWidget {
  const ReminderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
