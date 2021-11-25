import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'routes/home_route.dart';
import 'routes/talk_route.dart';
import 'routes/timeline_route.dart';
import 'routes/wallet_route.dart';
import 'routes/news_route.dart';


class RootWidget extends StatefulWidget{
  const RootWidget();

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget>
{
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.work,
  ];

  static const _footerItemNames = [
    'ホーム',
    'トーク',
    'タイムライン',
    'ニュース',
    'ウォレット',
  ];

  var _routes = [
    Home(),
    Talk(),
    TimeLine(),
    News(),
    Wallet(),
  ];

  @override
  void initState() {
    super.initState();
    for ( var i = 0; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_createState(i));
    }
  }

  /// インデックスのアイテムをアクティベートする
  BottomNavigationBarItem _createState(int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _footerIcons[index]
        ),
        label: _footerItemNames[index]
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      // _bottomNavigationBarItems[_selectedIndex] = _UpdateDeactiveState(_selectedIndex);
      // _bottomNavigationBarItems[index] = _UpdateActiveState(index);
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black26,
      ),
    );
  }
}