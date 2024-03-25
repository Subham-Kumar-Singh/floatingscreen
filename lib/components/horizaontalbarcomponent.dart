import 'dart:math';
import 'package:flutter/material.dart';

typedef void SelectedItemCallback(double money, int months);

class HorizontalBarItem extends StatelessWidget {
  final int month;
  final double money;
  final bool isSelected;
  final VoidCallback onTap;

  HorizontalBarItem({
    required this.month,
    required this.money,
    required this.isSelected,
    required this.onTap,
  });

  Color _randomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(56), // Red component between 200 and 255
      200 + random.nextInt(58), // Green component between 200 and 255
      200 + random.nextInt(56), // Blue component between 200 and 255
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topIconPadding = screenHeight * 0.02;
    double leftIconPadding = screenWidth * 0.04;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: _randomColor(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: leftIconPadding, top: topIconPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.03,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child:
                    isSelected ? Icon(Icons.check, color: Colors.white) : null,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '\$${money}/mo',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'for ${month} months',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: screenWidth * 0.4,
              height: screenHeight * 0.02,
            ),
            Text("See calculation")
          ],
        ),
      ),
    );
  }
}
