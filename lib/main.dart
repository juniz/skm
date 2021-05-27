import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SKM/constants.dart';
import 'package:SKM/login.dart';
import 'package:SKM/pageOne.dart';
import 'package:SKM/signup.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SURVEY KEPUASAN MASYARAKAT',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool phone = context.isPhone;
    bool tablet = context.isTablet;
    bool desktop = context.isLargeTablet;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: size.width,
                    color: kPrimaryColor,
                  ),
                  // Container(
                  //     height: double.infinity,
                  //     width: size.width / 2,
                  //     color: Colors.white),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: tablet
                      ? EdgeInsets.fromLTRB(32, 5, 10, 10)
                      : phone
                          ? EdgeInsets.fromLTRB(20, 5, 10, 10)
                          : EdgeInsets.all(32),
                  child: Text(
                    tablet
                        ? "Selamat Datang Di\nRS Bhayangkara Nganjuk"
                        : phone
                            ? "Selamat Datang Di\nRS Bhayangkara Nganjuk"
                            : size.width > 1400
                                ? "Selamat Datang Di RS Bhayangkara Nganjuk"
                                : "Selamat Datang Di RS Bhayangkara Nganjuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: phone ? 18 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: phone ? Alignment.topRight : Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(phone ? 10 : 15),
                  child: Row(
                    mainAxisAlignment: phone
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/polda.png',
                        width: 50,
                        height: 50,
                      ),
                      Image.asset(
                        'assets/img/dokes.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Padding(
              //     padding: EdgeInsets.all(32),
              //     child: Icon(
              //       Icons.menu,
              //       color: Color(0xFFFE4350),
              //       size: 28,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Copyright IT RSB NGANJUK 2021",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (widget, animation) =>
                    ScaleTransition(child: widget, scale: animation),
                child: selectedOption == Option.LogIn
                    ? LogIn(
                        onSignUpSelected: () {
                          setState(() {
                            selectedOption = Option.SignUp;
                          });
                        },
                      )
                    : selectedOption == Option.SignUp
                        ? SignUp(
                            onLogInSelected: () {
                              setState(() {
                                selectedOption = Option.LogIn;
                              });
                            },
                            onPageOneSelected: () {
                              setState(() {
                                selectedOption = Option.One;
                              });
                            },
                          )
                        : PageOne(
                            onLogInSelected: () {
                              setState(() {
                                selectedOption = Option.LogIn;
                              });
                            },
                            onSignUpSelected: () {
                              setState(() {
                                selectedOption = Option.SignUp;
                              });
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
