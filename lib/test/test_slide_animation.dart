import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Feature 1"),
                onTap: () {
                  Navigator.pop(context); // close bottom sheet
                  Navigator.of(context).push(
                      _slideRoute(const FeatureScreen(title: "Feature 1")));
                },
              ),
              ListTile(
                title: const Text("Feature 2"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      _slideRoute(const FeatureScreen(title: "Feature 2")));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openBottomSheet(context),
          child: const Text("Open Bottom Sheet"),
        ),
      ),
    );
  }
}

class FeatureScreen extends StatelessWidget {
  final String title;
  const FeatureScreen({super.key, required this.title});

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Do you want to dismiss without saving?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.of(context).pop(); // slide back
            },
            child: const Text("Dismiss"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              // Do save logic here...
              Navigator.of(context).pop(); // slide back after saving
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _showExitDialog(context),
        ),
      ),
      body: Center(child: Text("This is $title")),
    );
  }
}

Route _slideRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      // New page (slide in from right)
      var inTween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
          .chain(CurveTween(curve: curve));
      var inAnim = animation.drive(inTween);

      // Old page (slide out to left)
      var outTween = Tween(begin: Offset.zero, end: const Offset(-1.0, 0.0))
          .chain(CurveTween(curve: curve));
      var outAnim = secondaryAnimation.drive(outTween);

      return SlideTransition(
        position: inAnim,
        child: SlideTransition(
          position: outAnim,
          child: child,
        ),
      );
    },
  );
}
