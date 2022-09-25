// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/screens/search_page.dart';

import 'constants.dart';

class ClipContainer extends StatelessWidget {
  const ClipContainer({
    Key? key,
    required Color colorContainer,
    required this.text,
  })  : _colorContainer = colorContainer,
        super(key: key);

  final Color _colorContainer;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        color: _colorContainer,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class TestContainer extends StatefulWidget {
  
  const TestContainer({
    Key? key,
   
  }) : super(key: key);

  @override
  State<TestContainer> createState() => _TestContainerState();
}

class _TestContainerState extends State<TestContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 110,
          height: 100,
          color: Colors.blue,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 7, 5),
                height: 50,
                
                child: Image.asset('images/cloud-with-rain.png')),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //SizedBox(height: 10,),
                  Text('14:00', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  Text('32°C', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ForecastTile extends StatelessWidget {
  const ForecastTile({
    Key? key, required this.date, required this.temp, required this.dayOfWeek,
  }) : super(key: key);
  final String date;
  final String temp;
  final String dayOfWeek;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      width: 335,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 250,
          color: Color.fromRGBO(255, 255, 255, 0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dayOfWeek,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: kDateStyleY,
                    )
                  ],
                ),
              ),
              Text(
                '$temp°C',
                style: kTempStyleX,
              ),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  height: 30,
                  child: Image.asset(
                      'images/cloud-with-lightning-and-rain.png'))
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialNavBar extends StatefulWidget {
  const SpecialNavBar({super.key});

  @override
  State<SpecialNavBar> createState() => _SpecialNavBarState();
}

class _SpecialNavBarState extends State<SpecialNavBar> {
   PersistentTabController controller = PersistentTabController(initialIndex: 0);
   
   List<Widget> buildScreens() {
        return [
          HomePage(),
          SearchPage()
        ];
    }
   List<PersistentBottomNavBarItem> navBarsItems() {  
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.settings),
                title: ("Settings"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
       screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, 
    );
  }
}