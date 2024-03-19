import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/measurement-page.dart';
import 'package:gp_app_dev/utils.dart';
//import 'package:flutter/gestures.dart';
//import 'dart:ui';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        endDrawer: const Baricon(),
        appBar: AppBar(
          title: Text(
            'Coach Bot',
            style: SafeGoogleFont(
              'Zen Dots',
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2999999523 * ffem / fem,
              letterSpacing: -0.16 * fem,
              color: const Color(0xff000000),
            ),
          ),
        ),
        /*actions: [
            IconButton(
              // Use it as logout icon in the side bar
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ), end of appbar*/
        body: ListView(children: [
          /* if (FirebaseAuth.instance.currentUser!.emailVerified)
            const Text("Welcome")
          else
            const Text("Verify your email"),*/
          SizedBox(
              width: double.infinity,
              //child: SingleChildScrollView(
              child: Container(
                // homepageG2F (0:1493)
                padding:
                    EdgeInsets.fromLTRB(10 * fem, 0 * fem, 4 * fem, 0 * fem),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupmva3AtK (38erenCybynUeSqDnAMVA3)

                      margin: EdgeInsets.fromLTRB(
                          3 * fem, 0 * fem, 23 * fem, 66 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          /*Container(
                          // usern91 (0:1521)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 2 * fem),
                          width: 34 * fem,
                          height: 38 * fem,
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.contain,
                          ),
                        ),*/
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 2 * fem, 7 * fem),
                      width: 377 * fem,
                      height: 185 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15 * fem),
                      ),
                      child: Container(
                        // cardtodayactivity23M (0:1505)
                        padding: EdgeInsets.fromLTRB(
                            33 * fem, 20 * fem, 22.32 * fem, 20 * fem),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffd8dadc),
                          borderRadius: BorderRadius.circular(15 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x3ffbfbfb),
                              offset: Offset(0 * fem, 5 * fem),
                              blurRadius: 4 * fem,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // yourfirststeptofitnessJFm (0:1507)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 33 * fem, 12 * fem),
                              constraints: BoxConstraints(
                                maxWidth: 166 * fem,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: SafeGoogleFont(
                                    'Nunito',
                                    fontSize: 28 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.3639999117 * ffem / fem,
                                    color: const Color(0xdd3a3541),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Your \n',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 28 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.3625 * ffem / fem,
                                        color: const Color(0xdd3a3541),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'First Step',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 28 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.3625 * ffem / fem,
                                        color: const Color(0xffb68abd),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' To \n',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 28 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.3625 * ffem / fem,
                                        color: const Color(0xdd3a3541),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Fitness',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 28 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.3625 * ffem / fem,
                                        color: const Color(0xdd3a3541),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // colorfulldumbbellmBH (14:141)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 24.48 * fem),
                              width: 122.68 * fem,
                              height: 120.52 * fem,
                              child: Image.asset(
                                'assets/images/weights.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // cardtodayactivityg3M (0:1495)
                      margin: EdgeInsets.fromLTRB(
                          3 * fem, 0 * fem, 2 * fem, 16 * fem),

                      width: double.infinity,
                      height: 180 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0x118b07a1),
                        borderRadius: BorderRadius.circular(15 * fem),
                      ),

                      child: Stack(
                        children: [
                          Positioned(
                            // checkmarkPTZ (0:1496)
                            left: 187 * fem,
                            top: 36 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 165 * fem,
                                height: 107 * fem,
                                child: Image.asset(
                                  'assets/images/check.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // trackyourprogressHYw (0:1497)
                            left: 40.5 * fem,
                            top: 51 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 147 * fem,
                                height: 77 * fem,
                                child: Text(
                                  'Track Your \nProgress',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Nunito',
                                    fontSize: 28 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.3625 * ffem / fem,
                                    color: const Color(0xe53a3541),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // group106N4b (0:1498)
                      margin: EdgeInsets.fromLTRB(
                          3 * fem, 0 * fem, 0 * fem, 31 * fem),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Measurement3D()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 376 * fem,
                          height: 166 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 * fem),
                          ),
                          child: Container(
                            // cardtodayactivityTbq (0:1499)
                            padding: EdgeInsets.fromLTRB(
                                16 * fem, 20 * fem, 48 * fem, 39 * fem),
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff838591),
                              borderRadius: BorderRadius.circular(15 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x3ffbfbfb),
                                  offset: Offset(0 * fem, 5 * fem),
                                  blurRadius: 4 * fem,
                                ),
                              ],
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // image7LvX (0:1501)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 17 * fem, 0 * fem),
                                  width: 84 * fem,
                                  height: 107 * fem,
                                  child: Image.asset(
                                    'assets/images/body.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  // autogroupdnhhfhu (38et99tisqmNva647QdNHh)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      15 * fem, 25 * fem, 0 * fem, 0 * fem),
                                  child: Align(
                                    // visualizeyourbodyzkB (0:1502)
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 196 * fem,
                                        ),
                                        child: Text(
                                          'Visualize Your \nBody ',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Nunito',
                                            fontSize: 28 * ffem,
                                            fontWeight: FontWeight.w800,
                                            height: 1.3625 * ffem / fem,
                                            color: const Color(0xfffffcfc),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /*Container(
                    // autogroupbpfr62X (38erpMmMEkXysvYEwjbPFR)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 33 * fem, 0 * fem),
                    height: 73 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroup9ex3CrF (38es2X5kfkMeWCYsjB9ex3)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 11 * fem, 11 * fem, 18 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // videoplaylistYQK (0:1515)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                width: 55 * fem,
                                height: 29 * fem,
                                child: Image.asset(
                                  'assets/images/video-playlist.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // libraryrR1 (0:1512)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 0 * fem),
                                child: Text(
                                  'Library',
                                  style: SafeGoogleFont(
                                    'Nunito',
                                    fontSize: 11 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1789999875 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupozw7m2B (38es8S5ZpL37dWfYGoozW7)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 9 * fem, 16 * fem, 14 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // visualicon2hRd (0:1514)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 14 * fem, 6 * fem),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: SizedBox(
                                    width: 33 * fem,
                                    height: 31 * fem,
                                    child: Image.asset(
                                      'assets/images/visual-icon-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                // measurementzQj (0:1510)
                                'Measurement ',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1789999875 * ffem / fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupuvuzLUb (38esEGFBgT6uAQqNttuvuZ)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 33 * fem, 12 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // image15Uao (0:1503)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 6.13 * fem),
                                width: 50 * fem,
                                height: 41.87 * fem,
                                child: Image.asset(
                                  'assets/images/image-15.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // coachbotC11 (0:1511)
                                'Coach Bot',
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1789999875 * ffem / fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupfurhuRD (38esKbRdqpUb8qLFyifURH)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 3 * fem, 11 * fem, 0 * fem),
                          width: 56 * fem,
                          height: 70 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // homepageicone2cqR (0:1494)
                                left: 15 * fem,
                                top: 10 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 21 * fem,
                                    height: 23 * fem,
                                    child: Image.asset(
                                      'assets/images/home-page-icone-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // home835 (0:1508)
                                left: 13 * fem,
                                top: 43 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 30 * fem,
                                    height: 13 * fem,
                                    child: Text(
                                      'Home',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 11 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1789999875 * ffem / fem,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //highlight on current page
                              Positioned(
                                // rectangle189EM1 (0:1516)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 56 * fem,
                                    height: 70 * fem,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0x51d9d9d9),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogrouptd7y9ym (38esRbFeGrmjrZPkSttD7y)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 10 * fem, 0 * fem, 14 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // inprogresstwM (0:1513)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 6.36 * fem),
                                width: 36 * fem,
                                height: 29.64 * fem,
                                child: Image.asset(
                                  'assets/images/in-progress.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // trackq5u (0:1509)
                                margin: EdgeInsets.fromLTRB(
                                    1 * fem, 0 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'Track ',
                                  style: SafeGoogleFont(
                                    'Nunito',
                                    fontSize: 11 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1789999875 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ), 
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),*/
                    // Add this line
                  ],
                ),
              )),
          // )
        ]));
  }
}
