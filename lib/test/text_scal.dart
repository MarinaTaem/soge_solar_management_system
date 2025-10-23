import 'package:flutter/material.dart';

class TextScale extends StatelessWidget {
  const TextScale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    // width: 200, // Fixed width container
                    // height: 60, // Fixed height container
                    color: Colors.grey[200],
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Important Data Here 1 wher are you now',
                        style: TextStyle(
                            fontSize: 50), // This will scale down as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    // width: 200, // Fixed width container
                    //  height: 60, // Fixed height container
                    color: Colors.grey[200],
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        ' 2 Important Data Here about you',
                        style: TextStyle(
                            fontSize: 50), // This will scale down as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
