import 'package:flutter/material.dart';
import 'package:solar_management_system/test/text_auto_size_helper_test.dart';

class TestMain extends StatelessWidget {
  const TestMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextAutoSizeHelperTest(
                text: 'There is world, this is the ereal fdffdf w1nfdf',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
