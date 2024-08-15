import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final List<Color> lightGradientColors;
  final List<Color> darkGradientColors;

  const GradientScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.lightGradientColors = const [Color.fromARGB(255, 125, 240, 255), Color.fromARGB(255, 255, 255, 255)],
    this.darkGradientColors = const [Color.fromARGB(255, 124, 149, 151), Color.fromARGB(255, 105, 165, 159)],
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                transform: const GradientRotation(60),
                colors: isDarkMode ? darkGradientColors : lightGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              if (appBar != null) appBar!,
              Expanded(child: body),
            ],
          ),
        ],
      ),
    );
  }
}
