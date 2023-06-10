import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite/data/icons_data.dart';
import 'package:nano_health_suite/presentation/pages/home_page/home_page.dart';
import 'package:nano_health_suite/utils/constants/app_colors.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Cart Screen',
      style: optionStyle,
    ),
    Text(
      'Index 2: Favorites Screen',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile Screen',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22), // adjust to your liking
            topRight: Radius.circular(22), // adjust to your liking
          ),
          color: kWhiteColor, // put the color here
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                homeBottomIcon,
                colorFilter:
                    const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                homeBottomIcon,
                colorFilter:
                    const ColorFilter.mode(Color(0xffbfc2c7), BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                cartBottomIcon,
                colorFilter:
                    const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(cartBottomIcon),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                likeBottomIcon,
                colorFilter:
                    const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                likeBottomIcon,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                userBottomIcon,
                colorFilter:
                    const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(userBottomIcon),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
