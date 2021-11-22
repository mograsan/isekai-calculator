import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('ホーム'),
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.settings)
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      ],
      backgroundColor: Colors.black87,
      elevation: 0.0,
    );
  }
}