// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chatbotapp/screens/chat_history_screen.dart';
import 'package:chatbotapp/screens/chat_screen.dart';
import 'package:chatbotapp/screens/profile_screen.dart';
import 'package:chatbotapp/widgets/gradient_scaffold.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow for better gradient visibility
        centerTitle: true,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              backgroundImage: AssetImage('assets/images/gemini.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10 , top: 10.0),
              child: OutlinedTextWidget(
                text: "Gemini Chat",
                fontSize: 20.0,
                textColor: Color.fromARGB(255, 3, 3, 3),
                outlineColor: Colors.black38,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const OutlinedTextWidget(
                text: "Hello, Priyanshu !!",
                fontSize: 35.0,
                textColor: Color.fromARGB(255, 255, 8, 8),
                outlineColor: Color.fromARGB(255, 255, 202, 202),
              ),
              const SizedBox(height: 20),
              const OutlinedTextWidget(
                text: "How can I help you today?",
                fontSize: 50.0,
                textColor: Colors.grey,
                outlineColor: Color.fromARGB(255, 51, 51, 51),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatHistoryScreen()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Theme.of(context).textTheme.titleLarge!.color!,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: OutlinedTextWidget(
                            text: "History",
                            fontSize: 40.0,
                            textColor: Theme.of(context).textTheme.titleLarge!.color!,
                            outlineColor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        _showComingSoonSnackBar(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Theme.of(context).textTheme.titleLarge!.color!,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedTextWidget(
                                  text: "AI",
                                  fontSize: 40.0,
                                  textColor: Theme.of(context).textTheme.titleLarge!.color!,
                                  outlineColor: Theme.of(context).canvasColor,
                                ),
                                OutlinedTextWidget(
                                  text: "voice",
                                  fontSize: 50.0,
                                  textColor: Theme.of(context).textTheme.titleLarge!.color!,
                                  outlineColor: Theme.of(context).canvasColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Theme.of(context).textTheme.titleLarge!.color!,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: OutlinedTextWidget(
                        text: "Let's Start",
                        fontSize: 50.0,
                        textColor: Theme.of(context).textTheme.titleLarge!.color!,
                        outlineColor: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoonSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Coming Soon!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class OutlinedTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color outlineColor;

  const OutlinedTextWidget({super.key, 
    required this.text,
    this.fontSize = 35.0,
    this.textColor = Colors.black,
    this.outlineColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [outlineColor, outlineColor, textColor, textColor],
          stops: const [0.0, 0.0, 1, 0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: outlineColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

Widget getAppBarGradientContainer(BuildContext context) {

  return  const Stack(
    children: [
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black12),
        ),
      ),
      Positioned.fill(
        child: FractionallySizedBox(
          heightFactor: 0.567,
          alignment: Alignment.bottomCenter,
          child: DecoratedBox(
         decoration: BoxDecoration(color: Colors.black12),
          ),
        ),
      ),
    ],
  );
}

AppBar getAppBarWithGradient(
  BuildContext context, {
  Widget? title,
  Widget? leading,
  bool automaticallyImplyLeading = true,
}) {
  return AppBar(
    title: title,
    flexibleSpace: getAppBarGradientContainer(context),
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}
