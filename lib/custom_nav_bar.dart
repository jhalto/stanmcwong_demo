import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}
 int currentIndex = 0;

 List<Widget> pages = [
  Center(child: Text("0",style: TextStyle(fontSize: 50),),)
 ];

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        
        color: Colors.red,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.purple,
              child: Center(
                child: Icon(Icons.add_road_sharp),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Center(
                child: Icon(Icons.add_road_sharp),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Center(
                child: Icon(Icons.add_road_sharp),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Center(
                child: Icon(Icons.add_road_sharp),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Center(
                child: Icon(Icons.add_road_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}