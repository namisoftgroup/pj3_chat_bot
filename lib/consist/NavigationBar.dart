import 'package:flutter/material.dart';
import 'package:gp_app_dev/library/content.dart';
import 'package:gp_app_dev/measurement-page.dart';
import 'package:gp_app_dev/profile/profilepage.dart';
//import 'package:gp_app_dev/startpages/share_progress.dart';
import 'package:gp_app_dev/startpages/homepage.dart';

import '../chat_bot_screen/Chatbot.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  List<Widget> indexScreens = [];

  @override
  void initState() {
    super.initState();

    indexScreens = [
      const Homepage(), // Home Page page navigation index
      const Center(
          child: Text('Track progress')), // Track page navigation index
      ChatbotScreen(), // Chatbot page navigation index
      Measurement3D(), // Measurement page navigation index
      const Content(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexScreens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 229, 211, 227),
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/home-page.png'),
            ),
            icon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/home-page.png'),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/in-progress.png'),
            ),
            icon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/in-progress.png'),
            ),
            label: 'Track',
          ),
          NavigationDestination(
            selectedIcon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/BotFace.png'),
            ),
            icon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/BotFace.png'),
            ),
            label: 'CoachBot',
          ),
          NavigationDestination(
            selectedIcon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/visualizer.png'),
            ),
            icon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/visualizer.png'),
            ),
            label: 'Measurement',
          ),
          NavigationDestination(
            selectedIcon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/video-playlist.png'),
            ),
            icon: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/video-playlist.png'),
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
