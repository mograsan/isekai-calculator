import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'output.dart';
import 'formula_controller.dart';
//
class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    final plusButtonColor = context.select((FormulaController controller) => controller.plusButtonColor);
    final plusButtonFontColor = context.select((FormulaController controller) => controller.plusButtonFontColor);
    final minusButtonColor = context.select((FormulaController controller) => controller.minusButtonColor);
    final minusButtonFontColor = context.select((FormulaController controller) => controller.minusButtonFontColor);
    final multipleButtonColor = context.select((FormulaController controller) => controller.multipleButtonColor);
    final multipleButtonFontColor = context.select((FormulaController controller) => controller.multipleButtonFontColor);
    final divideButtonColor = context.select((FormulaController controller) => controller.divideButtonColor);
    final divideButtonFontColor = context.select((FormulaController controller) => controller.divideButtonFontColor);
    final Color numButtonPrimaryColor = Colors.grey[900]!;
    final Color numButtonOnPrimaryColor = Colors.grey[200]!;
    const buttonHeight = 73.0;
    const buttonWidth = 73.0;
    return ChangeNotifierProvider(
        create: (context) => FormulaController(),
        child: Container(
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
                    width: buttonWidth,
                    height: buttonHeight,
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
                        onPrimary: Colors.black,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().allClear(),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          'C',
                          style: TextStyle(
                              fontSize: 34.0,
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
                      onPressed: () =>
                          context.read<FormulaController>().clear(),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '%',
                          style: TextStyle(
                              fontSize: 34.0,
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
                      onPressed: () => context.read<FormulaController>().convertToPercentile(),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text(
                          '÷',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w400,
                              color: divideButtonFontColor
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: divideButtonColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().applyOperator('/'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '7',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.read<FormulaController>().addNumber('7');
                      },
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '8',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('8'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '9',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('9'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text(
                          '×',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w400,
                              color: multipleButtonFontColor
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: multipleButtonColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().applyOperator('*'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '4',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('4'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '5',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('5'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '6',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('6'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: 42.0,
                              fontWeight: FontWeight.w400,
                              color: minusButtonFontColor
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: minusButtonColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().applyOperator('-'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '1',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('1'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '2',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('2'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '3',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('3'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: Text(
                          '+',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w400,
                              color: plusButtonFontColor
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: plusButtonColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () => context.read<FormulaController>().applyOperator('+'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '0',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          context.read<FormulaController>().addNumber('0'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
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
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () => context.read<FormulaController>().changeCode(),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      child: const Text(
                          '.',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: numButtonPrimaryColor,
                        onPrimary: numButtonOnPrimaryColor,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () => context.read<FormulaController>().addNumber('.'),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
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
                      onPressed: () =>
                          context.read<FormulaController>().applyOperator('='),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}