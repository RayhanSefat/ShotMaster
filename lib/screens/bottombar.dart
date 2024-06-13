import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stancebeam/screens/blog/blogs.dart';
import 'package:stancebeam/screens/homes/coachscreen.dart';
import 'package:stancebeam/screens/homes/playscreen.dart';
import 'package:stancebeam/screens/homes/profilescreen.dart';
import 'package:stancebeam/screens/homes/sessionscreen.dart';
import 'package:stancebeam/screens/registrationscreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  List icons = [
    Icons.play_circle_outline,
    Icons.video_collection_outlined,
    Icons.supervised_user_circle_outlined,
    Icons.person,
  ];
  List titles = [
    'Play',
    'Sessions',
    'Coach Connect',
    'Profile',
  ];
  List appBarTitles = [
    'Play',
    'Sessions',
    'Coach Connect',
    'Profile',
  ];

  List<Widget> pages = [
    PlayScreen(),
    SessionsScreen(),
    CoachScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[index]),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to Log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegistrationScreen()),
                            (route) => false);
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.energy_savings_leaf_outlined),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AllBlogs()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        activeIndex: index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        onTap: (i) => setState(() => index = i), itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[index]),
              Text(
                titles[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
            ],
          );
        },
        //other params
      ),
    );
    ;
  }
}
