// bottom_bar.dart
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const BottomBar({
    super.key,
    required this.onTabSelected,
  });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.black26,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          widget.onTabSelected(index);
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Law',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'my Page',
        ),
      ],
    );
  }
}
