import 'package:flutter/material.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareProgress extends StatelessWidget {
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
      body: Builder(
        builder: (BuildContext context) {
          double baseWidth = 393;
          double fem = MediaQuery.of(context).size.width / baseWidth;
          double ffem = fem * 0.97;

          return Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 100 * fem, 19 * fem, 100 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                22 * fem, 0 * fem, 0 * fem, 10 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 246 * fem,
                            ),
                            child: Text(
                              'Share \nyour progress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 36 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.1790000068 * ffem / fem,
                                color: Color.fromARGB(255, 171, 97, 184),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                23 * fem, 0 * fem, 0 * fem, 30 * fem),
                            child: Text(
                              'With your friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 32 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.17900002 * ffem / fem,
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                28 * fem, 0 * fem, 0 * fem, 14 * fem),
                            width: 164 * fem,
                            height: 268 * fem,
                            child: Image.asset(
                              'assets/images/fitness-watch.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          XShareButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class XShareButton extends StatelessWidget {
  final double fem = 1.0; // Define your 'fem' value
  final double ffem = 1.0; // Define your 'ffem' value
  Future<void> _shareOnX() async {
    final tweetText =
        'Hey there! I would like to share my progress that I made today...... #CoachbotApp 💪🏻💜 '; // Predefined tweet text
    final url =
        'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(tweetText)}';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _shareOnX,
      child: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 17 * fem),
        width: 284 * fem,
        height: 59 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29.5 * fem),
          color: Color.fromARGB(255, 96, 3, 110),
        ),
        child: Center(
          child: Text(
            'Share on X',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24 * ffem,
              fontWeight: FontWeight.w700,
              height: 1.3625 * ffem / fem,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
