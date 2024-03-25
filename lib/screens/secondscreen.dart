import 'package:floatingscreen/components/horizaontalscrollbar.dart';
import 'package:floatingscreen/screens/thirdscreen.dart';
import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  late bool _isDragging1;
  double selectedMoney = 0.0;
  int selectedMonths = 0;

  @override
  void initState() {
    super.initState();
    _isDragging1 = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    double topIconpadding = screenheight * 0.02;
    double leftIconpadding = screenwidth * 0.05;
    double rigthIconpadding = screenwidth * 0.09;

    return Container(
      height: screenheight * 0.75,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 36, 36, 51),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: screenwidth,
            child: Padding(
              padding: EdgeInsets.only(
                top: topIconpadding,
                left: leftIconpadding,
                right: rigthIconpadding,
              ),
              child: _isDragging1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "EMI",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "₹$selectedMoney" + " /mo",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "duration",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "$selectedMonths" + " months",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "how do you wish to repay?",
                          color: Color.fromARGB(255, 192, 187, 187),
                          fontSize: 20,
                        ),
                        SizedBox(height: screenheight * 0.01),
                        const CustomText(
                          text:
                              "Choose one of our recommended plans or make your own",
                          color: Color.fromARGB(255, 110, 105, 105),
                          fontSize: 15,
                        ),
                        SizedBox(height: screenheight * 0.04),
                        HorizontalBar(
                          onItemSelected: (money, months) {
                            setState(() {
                              selectedMoney = money;
                              selectedMonths = months;
                            });
                          },
                        ),
                        SizedBox(height: screenheight * 0.04),
                        Container(
                          width: screenwidth * 0.4,
                          height: screenheight * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Create your own plan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenwidth,
              height: screenheight * 0.08,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 74, 76, 184),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useRootNavigator: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const Thirdscreen();
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
                    'Select your bank account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
