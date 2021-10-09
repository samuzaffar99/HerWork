import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cardbg2.png"),
              // image: AssetImage("assets/cardbg2.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Tuesday, 5th October",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Syeda Raheela Khan",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
              Divider(),
              Text(
                "Total Earnings",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                " 6,142 Rs.",
                textScaleFactor: 3,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              // Text("${DateTime.now().day}"),
            ],
          ),
        ),
      ),
    );
  }
}
