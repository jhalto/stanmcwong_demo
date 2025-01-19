import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
   final PageController _pageController = PageController();

   final List<Widget> pages = [
    Center(child: Text("Home Page", style: TextStyle(fontSize: 20))),
    Center(child: Text("ABC Page", style: TextStyle(fontSize: 20))),
    Center(child: Text("Time Page 1", style: TextStyle(fontSize: 20))),
    Center(child: Text("Time Page 2", style: TextStyle(fontSize: 20))),
    Center(child: Text("Sharp Time Page", style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.red,
        onTap: (value) {
          setState(() {
            currentIndex = value;

          });
           _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInSine,
          );
        },
        
        items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.yellow,
          
          icon: Icon(Icons.ac_unit),label: "Home"),
        BottomNavigationBarItem(
          backgroundColor: Colors.lightGreen,
          icon: Icon(Icons.abc_rounded),label: "Home"),
        BottomNavigationBarItem(
          backgroundColor: Colors.indigoAccent,
          icon: Icon(Icons.access_time),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.access_time),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.access_time_sharp),label: "Home"),
      
      ]),
    );
  }
}