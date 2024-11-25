import 'package:flutter/material.dart';
import 'package:news_app/views/homescreen/homescreen.dart';
import 'package:news_app/views/profilescreen/profilescreen.dart';
import 'package:news_app/views/savedscreen/savedscreen.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int selectedtab = 0;
  List screen = [Homescreen(), Savedscreen(), Profilescreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedtab],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedtab,
          onTap: (value) {
            selectedtab = value;
            setState(() {});
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "profile"),
          ]),
    );
  }
}
