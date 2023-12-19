import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'classic.dart';
import 'countdown.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    home: const splash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.red,
      /*  textTheme: TextTheme(
          displayMedium: GoogleFonts.audiowide(
              fontSize: 16.0, letterSpacing: 2.0, color: Colors.black),
          displayLarge: GoogleFonts.audiowide(
              fontSize: 40.0,
              letterSpacing: 2.0,
              wordSpacing: 4.0,
              color: Colors.black),
          displaySmall:
              GoogleFonts.audiowide(fontSize: 40.0, color: Colors.white),
          bodyMedium: GoogleFonts.lobster(
            color: Colors.white,
            fontSize: 20.0,
          ),
        )*/
    ),
  ));
}

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Padding(
        padding: const EdgeInsets.only(top: 44.0),
        child: Column(
          children: [
            Image.asset(
              "assets/Images/icon.gif",
              fit: BoxFit.cover,
              height: 112,
              width: 112,
            ),
            Text("Things Are Getting Ready..",
                style:  GoogleFonts.audiowide(
                    fontSize: 16.0, letterSpacing: 2.0, color: Colors.black)),
          ],
        ),
      ),
      splashIconSize: 178.0,
      duration: 2700,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: const Duration(milliseconds: 800),
      nextScreen: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/Images/tic-tac-toe-game-texture-hand-drawn-seamless-cross-shapes-pattern-black-elements-on-white-background-2GGD3MM (1).jpg"),
              fit: BoxFit.cover,
              opacity: 0.05)),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 244.0), //212
              child: Padding(
                padding: const EdgeInsets.only(right: 212.0),
                child: Text("Tic",
                    style: GoogleFonts.audiowide(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        wordSpacing: 4.0,
                        color: Colors.black),),
              ),
            ),
            Text("Tac", style:  GoogleFonts.audiowide(
                fontSize: 40.0,
                letterSpacing: 2.0,
                wordSpacing: 4.0,
                color: Colors.black),),
            Padding(
              padding: const EdgeInsets.only(left: 212.0),
              child:
                  Text("Toe", style:  GoogleFonts.audiowide(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      wordSpacing: 4.0,
                      color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 136.0), //158
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: const classic(),
                          type: PageTransitionType.size,
                          alignment: Alignment.center,
                          curve: Curves.decelerate,
                          childCurrent: const Home(),
                          duration: const Duration(milliseconds: 650),
                          reverseDuration: const Duration(milliseconds: 350),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("Classic Mode",
                        style:  GoogleFonts.audiowide(
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            wordSpacing: 4.0,),),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: const countdown(),
                          type: PageTransitionType.size,
                          alignment: Alignment.center,
                          curve: Curves.decelerate,
                          childCurrent: const Home(),
                          duration: const Duration(milliseconds: 650),
                          reverseDuration: const Duration(milliseconds: 350),
                        ));
                  },
                  child: Text("Countdown Mode",
                      style:  GoogleFonts.audiowide(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          wordSpacing: 4.0,),)),
            ),
            const SizedBox(
              height: 92.0,
            ),
            SizedBox(
              height: 50,
              width: 286,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.rate_review, size: 40.0),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 52.0),
                    child: Icon(Icons.share, size: 40.0),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 48.0),
                    child: Icon(Icons.star, size: 40.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 286,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("Review",
                        style: GoogleFonts.audiowide(
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            wordSpacing: 4.0,
                            color: Colors.black),),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Share",
                        style:  GoogleFonts.audiowide(
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            wordSpacing: 4.0,
                            color: Colors.black),),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text("Rate",
                        style: GoogleFonts.audiowide(
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            wordSpacing: 4.0,
                            color: Colors.black),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
