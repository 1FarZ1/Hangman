import "package:flutter/material.dart";
import 'package:game/Screens/home.dart';
import 'package:game/Screens/menu.dart';

class Winning extends StatelessWidget {
  final String winning_word;
  bool IsWinning;
  
  Winning(this.winning_word,this.IsWinning);
  Text state(){
    String chosen_String = this.IsWinning ? "Congrats You've Won !":"Sorry you ran out of lifes";
    return Text( "${chosen_String}  the word was: ${this.winning_word} ",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900));
  }
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
                height: 240,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff2B1F69),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
                child: state()
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext build) {
                    return Menu();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2B1F69),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Text("Back to main Menu",
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),
              ),
            ]),
          )),
    );
  }
}
