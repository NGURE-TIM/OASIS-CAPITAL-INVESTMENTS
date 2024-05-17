
import 'package:flutter/material.dart';
import 'package:fulusi/home/profile.dart';

import '../colors/colors.dart';
import 'package:fulusi/home/dashboard.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Home extends StatefulWidget {
const Home({super.key});

@override
State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected=0;
  PageController controller =PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: mainOrange,
bottomNavigationBar: StylishBottomBar(
  option: DotBarOptions(
    dotStyle: DotStyle.tile,
  ),

  items: [
    BottomBarItem(
        icon: const Icon(
            Icons.house_outlined
        ),
        selectedIcon: const Icon(
            Icons.house_sharp
        ),
        title: const Text('Home'),
        selectedColor: mainBlue,
        unSelectedColor: grey
    ),
    BottomBarItem(
        icon: const Icon(
            Icons.person_outline_sharp
        ),
        selectedIcon: Icon(
            Icons.person
        ),
        title: const Text('Profile'),
        selectedColor: mainBlue,
        unSelectedColor: grey
    )
  ],
  currentIndex: selected,
  onTap: (index) {
    setState(() {
     selected = index;
    });
   controller.jumpToPage(index);
  },
),
body: SafeArea(
child: PageView(
  physics: NeverScrollableScrollPhysics(),
controller: controller,
children:  [

Dash(),
  Profile(),
],
),
),
);
}
}
