import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class countdown extends StatefulWidget {
  const countdown({Key? key}) : super(key: key);

  @override
  State<countdown> createState() => _countdownState();
}

class _countdownState extends State<countdown> {
  bool oturn = true;
  static const maxseconds = 25.0;
  var seconds = maxseconds;
  Timer? timer;
  var result = "";
  var istimerrunning = false;
  var onstartbutton = false;
  List<String> identity = ["", "", "", "", "", "", "", "", ""];
  List<int> matchedindex = [];

  var scoreo = 0;
  var scorex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "2nd button",
          child: Text("Tic Tac Toe",
              style:  GoogleFonts.audiowide(fontSize: 24.0, color: Colors.white)),
        ),
        centerTitle: true,
        elevation: 5.0,
        shadowColor: Colors.white54,
        backgroundColor: Colors.red[800],
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("ScoreBoard",
                      style:  GoogleFonts.audiowide(fontSize: 20.0, color: Colors.white)),
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
                        style:GoogleFonts.lobster(
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
                            border: Border.all(
                              width: 2,
                              color: Colors.yellow,
                            ),
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
                visible: onstartbutton == true &&
                    result == "" &&
                    istimerrunning == false,
                child: Column(
                  children: [
                    Text("Time's Up ",
                        style: GoogleFonts.audiowide(
                            color: Colors.white, fontSize: 20.0)),
                    Text("You Both Lose 1 point ",
                        style: GoogleFonts.audiowide(
                            color: Colors.white, fontSize: 16.0)),
                  ],
                ),
              ),
              Visibility(
                visible: istimerrunning == true &&
                    result == "" &&
                    onstartbutton == true &&
                    oturn == true,
                child: Text(" O Turn",
                    style: GoogleFonts.audiowide(
                        color: Colors.white, fontSize: 20.0)),
              ),
              Visibility(
                visible: istimerrunning == true &&
                    result == "" &&
                    onstartbutton == true &&
                    oturn != true,
                child: Text(" X Turn",
                    style: GoogleFonts.audiowide(
                        color: Colors.white, fontSize: 20.0)),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Visibility(
                visible: istimerrunning != true &&
                    result == "" &&
                    onstartbutton != true,
                child: Padding(
                  padding: const EdgeInsets.all(52.0),
                  child: ElevatedButton(
                      onPressed: () {
                        starttimer();
                        onstartbutton2();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Start ",
                            style: GoogleFonts.audiowide(fontSize: 16.0, color: Colors.white)),
                      )),
                ),
              ),
              Visibility(
                visible: onstartbutton == true &&
                    result != "" &&
                    istimerrunning != true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _clear();
                        starttimer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Play Again ",
                            style: GoogleFonts.audiowide(fontSize: 16.0)),
                      )),
                ),
              ),
              Visibility(
                visible: result == "" &&
                    istimerrunning != true &&
                    onstartbutton == true,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _clear();
                        losept();
                        starttimer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Play Again ",
                            style: GoogleFonts.audiowide(fontSize: 16.0)),
                      )),
                ),
              ),
              Visibility(
                  visible: result == "" &&
                      istimerrunning != false &&
                      onstartbutton == true,
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(fit: StackFit.expand, children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.red[900],
                          value: 1 - seconds / maxseconds,
                          valueColor:
                              AlwaysStoppedAnimation(Colors.yellow[300]),
                          strokeWidth: 8.0,
                        ),
                        Center(
                            child: Text("$seconds",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                )))
                      ])
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .shimmer(delay: 20000.ms, duration: 1000.ms)
                          .shake(hz: 15, curve: Curves.easeInOut)
                          .scaleXY(end: 1.1, duration: 600.ms)
                          .then(delay: 600.ms)
                          .scaleXY(end: 1 / 1.1)))
            ],
          ),
        ),
      ),
    );
  }

  void onstartbutton2() {
    setState(() {
      onstartbutton = true;
    });
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

  void losept() {
    setState(() {
      scorex--;
      scoreo--;
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

  void starttimer() {
    istimerrunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0 && result == "") {
          seconds--;
        } else {
          stoptimer();
        }
      });
    });
  }

  void stoptimer() {
    setState(() {
      istimerrunning = false;
      timer?.cancel();
      resettimer();
    });
  }

  void resettimer() => seconds = maxseconds;

  void _call(int index) {
    if (istimerrunning != false && result == "") {
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
}
