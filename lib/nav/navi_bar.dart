import 'package:flutter/material.dart';

import '../info/info_fragment.dart';
import '../invite/invite_fragment.dart';
import '../my/my_fragment.dart';

// 导航：资讯、邀请、我的
class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NaviBarState();
  }
}

class _NaviBarState extends State<NaviBar> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List _pageList = [
    const InfoFragment(),
    InviteFragment(),
    const MyFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            activeIcon: Icon(Icons.explore, color: Colors.red),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_invitation_rounded),
            activeIcon:
                Icon(Icons.insert_invitation_rounded, color: Colors.red),
            label: 'Invite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person, color: Colors.red),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
