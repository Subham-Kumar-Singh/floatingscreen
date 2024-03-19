import 'package:floatingscreen/components/progressbar.dart';
import 'package:floatingscreen/screens/secondscreen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _progressValue = 0.0;
  bool _isDragging = false;
  bool _isDragging1 = false;
  double topAreaLeftPadding = 0.0; // Initialize the left padding variable

  @override
  Widget build(BuildContext context) {
    String defaultText = "nikunj, how much do you need?";
    double final_progress_value = _progressValue * 1000;
    String displayText =
        _isDragging1 ? "Credit Amount " + '$final_progress_value' : defaultText;
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    double topIconpadding = screenheight * 0.07;
    double leftIconpadding = screenwidth * 0.05;
    double rigthIconpadding = screenwidth * 0.05;
    double innerboxleftpaddding = screenwidth * 0.06;
    double innerboxerightpaddding = screenwidth * 0.1;

    const TextStyle textStyle = TextStyle(
      color: Color.fromARGB(255, 192, 187, 187),
      fontSize: 20,
    );
    const TextStyle infoTextStyle = TextStyle(
      color: Color.fromARGB(255, 110, 105, 105),
      fontSize: 16,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 26),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: topIconpadding,
                    left: leftIconpadding,
                    right: rigthIconpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close,
                            color: Color.fromARGB(255, 192, 187, 187)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 37, 34, 34)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark,
                            color: Color.fromARGB(255, 192, 187, 187)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 37, 34, 34)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                        ))
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenwidth,
              height: screenheight * 0.85,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 36, 51),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(
                    color: const Color.fromARGB(255, 9, 9, 19), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    // top: topIconpadding,
                    left: innerboxleftpaddding,
                    right: innerboxerightpaddding),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenheight * 0.03,
                          ),
                          Text(
                            displayText,
                            style: _isDragging1 ? textStyle : infoTextStyle,
                          ),
                          SizedBox(
                            height: screenheight * 0.02,
                          ),
                          Text(
                              _isDragging1
                                  ? ""
                                  : "move the dial and set any amount you need upto  ",
                              style: infoTextStyle),
                          SizedBox(
                            height: screenheight * 0.02,
                          )
                        ]),
                    Container(
                        width: screenwidth * 0.9,
                        height: screenheight * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: CircularProgressBar(
                          onProgressChanged: (value) {
                            setState(() {
                              _progressValue = value;
                              _isDragging = true;
                              print('Updated _progressValue: $_progressValue');
                            });
                          },
                        ))),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: screenwidth,
                height: screenheight * 0.08,
                // color: Colors.red,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 74, 76, 184),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      )),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useRootNavigator: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const Secondscreen();
                      },
                    ).then((_) {
                      setState(() {
                        _isDragging1 = false;
                      });
                    });
                    setState(() {
                      _isDragging1 = true;
                    });
                  },
                  child: const Center(
                    child: Text(
                      'Proceed to EMI selection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
