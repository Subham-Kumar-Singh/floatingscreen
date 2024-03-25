import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Thirdscreen extends StatefulWidget {
  const Thirdscreen({super.key});

  @override
  State<Thirdscreen> createState() => _ThirdscreenState();
}

class _ThirdscreenState extends State<Thirdscreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    double topIconpadding = screenheight * 0.02;
    double leftIconpadding = screenwidth * 0.05;
    double rigthIconpadding = screenwidth * 0.09;
    return Container(
        // width: double.infinity,
        height: screenheight * 0.64,
        width: screenwidth,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 36, 36, 51),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: topIconpadding,
            left: leftIconpadding,
            right: rigthIconpadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "where should we send the money?",
                style: TextStyle(
                  color: Color.fromARGB(255, 192, 187, 187),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "amount will be credited to this bank account, EMI will also be devbited from this bank account",
                style: TextStyle(
                    color: Color.fromARGB(255, 110, 105, 105), fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: screenheight * 0.05,
                child: Row(children: [
                  Image.asset('assets/images/hdfclogo.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HDFC Bank",
                        style: TextStyle(
                          color: Color.fromARGB(255, 192, 187, 187),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "XXXX-XXXX-XXXX-1234",
                        style: TextStyle(
                          color: Color.fromARGB(255, 192, 187, 187),
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.check, color: Colors.white),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: screenheight * 0.03,
                width: screenwidth * 0.28,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 192, 187, 187)),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("Change Account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 192, 187, 187),
                        fontSize: 13,
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
