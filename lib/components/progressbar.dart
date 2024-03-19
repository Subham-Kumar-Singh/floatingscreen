import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {
  final void Function(double) onProgressChanged;

  const CircularProgressBar({Key? key, required this.onProgressChanged})
      : super(key: key);

  @override
  _CircularProgressBarState createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  double _progressValue = 0.0;
  double _startAngle = 0.0;
  // bool _isDragging = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        Offset center = Offset(125, 125);
        _startAngle = (details.localPosition - center).direction;
      },
      onPanUpdate: (details) {
        Offset center = Offset(125, 125);
        double currentAngle = (details.localPosition - center).direction;
        double angleDifference = currentAngle - _startAngle;
        double factor = 1.0 + (currentAngle / (2 * 3.14159265359)) * 7;
        _progressValue += factor * angleDifference / (2 * 3.14159265359);
        _progressValue = _progressValue.clamp(0.0, 1.0);

        _startAngle = currentAngle;
        // _isDragging = true;
        widget.onProgressChanged(_progressValue);
        // widget.onProgressChanged(_isDragging);

        setState(() {});
      },
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 250.0,
              height: 250.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                color: const Color.fromARGB(255, 248, 131, 52),
                strokeWidth: 13.0,
                value: _progressValue,
                // strokeCap: StrokeCap.round,
              ),
            ),
          ),
          Center(
            child: Text(
              '${(_progressValue * 1000).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
