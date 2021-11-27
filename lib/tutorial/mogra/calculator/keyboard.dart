import 'package:flutter/material.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // margin: const EdgeInsets.only(bottom: 80),
      decoration: const BoxDecoration(
          color: Colors.black
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      'AC',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    onPrimary: Colors.grey[400],
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      'C',
                      style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  )
                ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '%',
                      style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  )
                ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                    '÷',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '7',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '8',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '9',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '×',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '4',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '5',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '6',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '-',
                      style: TextStyle(
                          fontSize: 42.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '1',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '2',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '3',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '+',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '0',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '+/-',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '.',
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[800],
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: ElevatedButton(
                  child: const Text(
                      '=',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}