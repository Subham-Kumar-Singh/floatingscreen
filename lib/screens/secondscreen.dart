import 'package:floatingscreen/screens/Thirdscreen.dart';
import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      // width: double.infinity,
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
          const Center(
              child: Text("Hola ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
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
                        return const Thirdscreen();
                      },
                    );
                  },
                  child: const Center(
                    child: Text(
                      'jgfrjherfjvbervb',
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
