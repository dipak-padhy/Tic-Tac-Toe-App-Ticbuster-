import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class classic extends StatefulWidget {
  const classic({Key? key}) : super(key: key);

  @override
  State<classic> createState() => _classicState();
}

class _classicState extends State<classic> {
  bool oturn = true;
  var result = "";
  bool startbutton = false;
  List<String> identity = ["", "", "", "", "", "", "", "", ""];
  List<int> matchedindex = [];
  var scoreo = 0;
  var scorex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe",
            style:  GoogleFonts.audiowide(fontSize: 24.0, color: Colors.white),),
        centerTitle: true,
        elevation: 5.0,
        shadowColor: Colors.white54,
        backgroundColor: Colors.red[800],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("ScoreBoard",
                      style: GoogleFonts.audiowide(fontSize: 20.0, color: Colors.white),),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text("Player O",
                          style: GoogleFonts.lobster(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                    ),
                    const SizedBox(
                      width: 198.0,
                    ),
                    Text("Player X",
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 42.0),
                      child: Text(scoreo.toString(),
                          style: GoogleFonts.lobster(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                    ),
                    const SizedBox(
                      width: 264.0,
                    ),
                    Text(scorex.toString(),
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),),
                  ],
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0),
                      itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(width: 2, color: Colors.yellow),
                            color: matchedindex.contains(index)
                                ? Colors.yellow[600]
                                : Colors.black,
                          ),
                          child: TextButton(
                              onPressed: () {
                                _call(index);
                              },
                              child: fixcolors(index))),
                      itemCount: 9,
                    ),
                  )),
              const SizedBox(
                height: 16.0,
              ),
              Visibility(
                  visible: result != "",
                  child: Text(result,
                      style: GoogleFonts.lobster(
                          fontSize: 24.0, color: Colors.white))),
              Visibility(
                visible: startbutton == true && result == "" && oturn == true,
                child: Text(" O Turn",
                    style: GoogleFonts.audiowide(
                        color: Colors.white, fontSize: 20.0)),
              ),
              Visibility(
                visible: startbutton == true && result == "" && oturn != true,
                child: Text(" X Turn",
                    style: GoogleFonts.audiowide(
                        color: Colors.white, fontSize: 20.0)),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Visibility(
                visible: result == "" && startbutton != true,
                child: Padding(
                  padding: const EdgeInsets.all(52.0),
                  child: ElevatedButton(
                      onPressed: () {
                        isstarted();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Start ",
                            style:  GoogleFonts.audiowide(fontSize: 16.0, color: Colors.white),),
                      )),
                ),
              ),
              Visibility(
                visible: result != "" && startbutton == true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Play Again ",
                            style: GoogleFonts.audiowide(fontSize: 16.0)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isstarted() {
    setState(() {
      startbutton = true;
    });
  }

  Widget fixcolors(int index) {
    if (identity[index] == 'O') {
      return Text(identity[index],
          style: GoogleFonts.creepster(fontSize: 42.0, color: Colors.red[400]));
    } else {
      return Text(identity[index],
          style:
              GoogleFonts.creepster(fontSize: 42.0, color: Colors.blue[400]));
    }
  }

  void _call(int index) {
    if (result == "" && startbutton == true) {
      setState(() {
        if (oturn == true && identity[index] == "") {
          identity[index] = 'O';
          oturn = !oturn;
        }
        if (!oturn && identity[index] == "") {
          identity[index] = 'X';
          oturn = !oturn;
        }

        if (result == "") {
          _winner();
        }
      });
    }
  }

  void _winner() {
    if (identity[0] != "" &&
        identity[1] != "" &&
        identity[2] != "" &&
        identity[3] != "" &&
        identity[4] != "" &&
        identity[5] != "" &&
        identity[6] != "" &&
        identity[7] != "" &&
        identity[8] != "") {
      setState(() {
        result = "Draw";
      });
    }
    if (identity[0] == identity[1] &&
        identity[0] == identity[2] &&
        identity[0] != "") {
      setState(() {
        matchedindex.addAll([0, 1, 2]);
        result = "Player ${identity[0]}  wins";
        if (identity[0] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[3] == identity[4] &&
        identity[3] == identity[5] &&
        identity[3] != "") {
      setState(() {
        matchedindex.addAll([3, 4, 5]);
        result = "Player ${identity[3]}  wins";
        if (identity[3] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[6] == identity[7] &&
        identity[6] == identity[8] &&
        identity[6] != "") {
      setState(() {
        matchedindex.addAll([6, 7, 8]);
        result = "Player ${identity[6]}  wins";
        if (identity[6] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[0] == identity[3] &&
        identity[0] == identity[6] &&
        identity[0] != "") {
      setState(() {
        matchedindex.addAll([0, 3, 6]);
        result = "Player ${identity[0]}  wins";
        if (identity[0] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[1] == identity[4] &&
        identity[1] == identity[7] &&
        identity[1] != "") {
      setState(() {
        matchedindex.addAll([1, 4, 7]);
        result = "Player ${identity[1]}  wins";
        if (identity[1] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[2] == identity[5] &&
        identity[2] == identity[8] &&
        identity[2] != "") {
      setState(() {
        matchedindex.addAll([2, 5, 8]);
        result = "Player ${identity[2]}  wins";
        if (identity[2] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[0] == identity[4] &&
        identity[0] == identity[8] &&
        identity[0] != "") {
      setState(() {
        matchedindex.addAll([0, 4, 8]);
        result = "Player ${identity[0]}  wins";
        if (identity[0] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
    if (identity[2] == identity[4] &&
        identity[2] == identity[6] &&
        identity[2] != "") {
      setState(() {
        matchedindex.addAll([2, 4, 6]);
        result = "Player ${identity[2]}  wins";
        if (identity[2] == 'O') {
          scoreo++;
        } else {
          scorex++;
        }
      });
    }
  }

  void _clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        identity[i] = "";
      }
    });
    if (matchedindex.isNotEmpty) {
      removeindex();
    }
    if (result.isNotEmpty) {
      resetresult();
    }
  }

  void removeindex() {
    matchedindex = [];
  }

  void resetresult() {
    result = "";
  }
}
