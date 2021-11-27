import 'package:flutter/material.dart';

class Output extends StatefulWidget {
  const Output({Key? key}) : super(key: key);

  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output>{
  final String _formula = '1+2';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            _formula,
            style: const TextStyle(
              fontSize: 85.0,
              fontWeight: FontWeight.w300,
              color: Colors.white
            )
          )
        )
      )
    );
  }
}