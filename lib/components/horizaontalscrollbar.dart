import 'package:floatingscreen/components/horizaontalbarcomponent.dart';
import 'package:flutter/material.dart';


class HorizontalBar extends StatefulWidget {
  final SelectedItemCallback onItemSelected;

  const HorizontalBar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  _HorizontalBarState createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  int selectedIndex = -1;

  void _handleTap(double money, int months, int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(money, months);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 0.2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HorizontalBarItem(
            month: 12,
            money: 100,
            isSelected: selectedIndex == 0,
            onTap: () => _handleTap(100, 12, 0),
          ),
          SizedBox(width: screenwidth * 0.06),
          HorizontalBarItem(
            month: 9,
            money: 200,
            isSelected: selectedIndex == 1,
            onTap: () => _handleTap(200, 9, 1),
          ),
          SizedBox(width: screenwidth * 0.06),
          HorizontalBarItem(
            month: 6,
            money: 300,
            isSelected: selectedIndex == 2,
            onTap: () => _handleTap(300, 6, 2),
          ),
          SizedBox(width: screenwidth * 0.06),
          HorizontalBarItem(
            month: 4,
            money: 400,
            isSelected: selectedIndex == 3,
            onTap: () => _handleTap(400, 4, 3),
          ),
          SizedBox(width: screenwidth * 0.06),
          HorizontalBarItem(
            month: 2,
            money: 500,
            isSelected: selectedIndex == 4,
            onTap: () => _handleTap(500, 2, 4),
          ),
          SizedBox(width: screenwidth * 0.06),
        ],
      ),
    );
  }
}
