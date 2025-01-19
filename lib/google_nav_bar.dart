import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBarDemo extends StatefulWidget {
  const GoogleNavBarDemo({super.key});

  @override
  State<GoogleNavBarDemo> createState() => _GoogleNavBarDemoState();
}

class _GoogleNavBarDemoState extends State<GoogleNavBarDemo> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 35,right: 20, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(104),
          color: Colors.white,
      
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withAlpha(40),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11),
          child: GNav(
           
            gap: 8,
            iconSize: 0,
            
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xffEF2235).withAlpha(50),
            
            tabs: [
              GButton(
                padding: EdgeInsets.zero,
                icon: Icons.circle, // Set a default icon
                leading: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _selectedIndex ==0? Color(0xffEF2235): Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedIndex ==0?Colors.transparent: Color(0xff3F322E)
                    )
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 0? "lib/assets/home.svg":"lib/assets/home1.svg"
                  )
                ),
                text: 'Home',
              ),
              GButton(
                padding: EdgeInsets.zero,
                icon: Icons.circle, // Set a default icon
                leading: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _selectedIndex ==1? Color(0xffEF2235):Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedIndex ==1?Colors.transparent: Color(0xff3F322E)
                    )
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 1? "lib/assets/love.svg":"lib/assets/love1.svg"
                  )
                ),
                text: 'Wishlist',
              ),
             GButton(
                padding: EdgeInsets.zero,
                icon: Icons.circle, // Set a default icon
                leading: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                     color: _selectedIndex ==2? Color(0xffEF2235): Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                       color: _selectedIndex ==2?Colors.transparent: Color(0xff3F322E)
                    )
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 2? "lib/assets/message.svg":"lib/assets/message1.svg"
                  )
                ),
                text: 'Message',
              ),
              GButton(
                padding: EdgeInsets.zero,
                icon: Icons.circle, // Set a default icon
                leading: Container(
                 padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                     color: _selectedIndex ==3? Color(0xffEF2235): Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                       color: _selectedIndex ==3?Colors.transparent: Color(0xff3F322E)
                    )
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == 3? "lib/assets/user.svg":"lib/assets/user1.svg"
                  )
                ),
                text: 'Profile',
              ),
              
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}