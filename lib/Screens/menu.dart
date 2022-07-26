import "package:flutter/material.dart";
import 'package:game/Screens/home.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff3A2A8C), Color.fromARGB(255, 104, 84, 208)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(children: [
              SizedBox(
                height: 140,
              ),
              Text(
                "HangMan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext build) {
                    return Home();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2B1F69),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Text("Start",
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2B1F69),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Text("Words Completed",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2B1F69),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Text("about",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(
                height: 160,
              ),
              Text("Created by : FarZ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900)),
            ]),
          )),
    );
  }
}
