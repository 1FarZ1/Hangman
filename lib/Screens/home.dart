import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:game/Screens/Winning.dart';
import 'package:game/utilities/game.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int Selected_index = 30;
  bool start = true;
  int tries = 6;
  String Selected_word = " ";
  String Display = "";

  List<String> Wrong = [];
  List<String> Correct = [];
  List<String> myletters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "SIzedBox",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  int getRandomNumber(i) {
    var rng = Random();
    return rng.nextInt(i);
  }

  void Choose_word() {
    print(Game.words_list);
    Selected_word = Game.words_list[getRandomNumber(Game.words_list.length)];
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    var temp = oldString;
    // dublicate letters
    for (int i = 0; i < Selected_word.length; i++) {
      if (Selected_word[i].toUpperCase() == newChar) {
        temp = temp.substring(0, i) + newChar + temp.substring(i + 1);
      }
    }
    return temp;
  }

  void getDisplay() {
    Choose_word();
    for (int i = 0; i < Selected_word.length; i++) {
      Display += " ";
    }
  }

//  the last things to do :and persone body
  @override
  void initState() {
    // Selected_word = "";
    // Display = "";
    // Correct_word = "";
    getDisplay();
    tries = 6;
    super.initState();
  }

  Widget makeWord(i) {
    return ChooseLetter(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xff3A2A8C),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(children: [
                Visibility(
                    visible: tries <= 6, child: Image.asset("assets/hang.png")),
                Visibility(
                    visible: tries <= 5, child: Image.asset("assets/head.png")),
                Visibility(
                    visible: tries <= 4, child: Image.asset("assets/body.png")),
                Visibility(
                    visible: tries <= 3, child: Image.asset("assets/la.png")),
                Visibility(
                    visible: tries <= 2, child: Image.asset("assets/ra.png")),
                Visibility(
                    visible: tries <= 1, child: Image.asset("assets/rl.png")),
                Visibility(
                    visible: tries <= 0, child: Image.asset("assets/ll.png")),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Wrap(
                  spacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    ...List.generate(Display.length, (index) {
                      var rng = Display[index];
                      return makeWord(rng);
                    })
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                    // will implement this later to make the last row in center
                    child: GridView.builder(
                        itemCount: 27,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 3,
                        ),
                        itemBuilder: (ctx, index) {
                          if (index == 21) {
                            return SizedBox();
                          } else if (Wrong.contains(myletters[index])) {
                            return WLetter(myletters[index]);
                          } else if (Correct.contains(myletters[index])) {
                            return RLetter(myletters[index]);
                          } else {
                            return Letter(
                              myletters[index],
                              () {
                                setState(() {
                                  if (Selected_index != index) {
                                    Selected_index = index;
                                    // print("i changed here ${Selected_index}");
                                  } else {
                                    Selected_index = 30;
                                  }
                                });
                              },
                              Selected_index,
                              index,
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (Selected_index == 30) {
                            } else if (Selected_word.toUpperCase()
                                .contains(myletters[Selected_index])) {
                              Correct.add(myletters[Selected_index]);
                              int temp = Selected_word.toUpperCase()
                                  .indexOf(myletters[Selected_index]);

                              Display = replaceCharAt(
                                  Display, temp, myletters[Selected_index]);

                              if (Display == Selected_word.toUpperCase()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext build) {
                                  return Winning(Display, true);
                                }));
                              }
                            } else {
                              Wrong.add(myletters[Selected_index]);
                              tries--;
                              if (tries == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext build) {
                                  return Winning(Selected_word, false);
                                }));
                              }
                            }
                          });
                          // print("The correct word is: ${Correct}");
                          // print("The Display word is: ${Display}");
                          // print("The selected word is: ${Selected_word}");
                          // print("The wrong word is: ${Wrong}");
                          Selected_index = 30;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff2B1F69),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 10),
                          child: Text("Confirm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 39, 30, 108),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text("Lives remaining :${tries}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 23)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Letter extends StatefulWidget {
  final String letter;
  VoidCallback myfun;
  int selected;
  int index;

  Letter(String this.letter, VoidCallback this.myfun, int this.selected,
      int this.index);

  @override
  State<Letter> createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  bool is_pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.myfun();
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            padding: const EdgeInsets.all(5),
            color: widget.selected == widget.index
                ? Color(0xff14B9EF)
                : Color(0xff2B1F69),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: widget.selected == widget.index
                    ? Color(0xff14B9EF)
                    : Color(0xff2B1F69),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(this.widget.letter,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900)),
                ),
              ),
            )),
      ),
    );
  }
}

class WLetter extends StatefulWidget {
  final String letter;
  WLetter(
    String this.letter,
  );

  @override
  State<WLetter> createState() => _WLetterState();
}

class _WLetterState extends State<WLetter> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(5),
          color: Color(0xff040311),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color(0xff040311),
              child: Align(
                alignment: Alignment.center,
                child: Text(this.widget.letter,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          )),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(color: Color(0xff2B1F69)),
    //     child: Text(this.letter,
    //         style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 35,
    //             fontWeight: FontWeight.w900)),
    //   ),
    // );
  }
}

class RLetter extends StatefulWidget {
  final String letter;
  RLetter(
    String this.letter,
  );

  @override
  _RLetterState createState() => _RLetterState();
}

class _RLetterState extends State<RLetter> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(5),
          color: Color(0xff14B9EF),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color(0xff14B9EF),
              child: Align(
                alignment: Alignment.center,
                child: Text(this.widget.letter,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          )),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(color: Color(0xff2B1F69)),
    //     child: Text(this.letter,
    //         style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 35,
    //             fontWeight: FontWeight.w900)),
    //   ),
    // );
  }
}

class ChooseLetter extends StatelessWidget {
  final String letter;
  ChooseLetter(String this.letter);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Color(0xff2B1F69)),
        child: Text(this.letter,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w900)),
      ),
    );
  }
}
