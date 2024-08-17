// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chatbotapp/screens/chat_history_screen.dart';
import 'package:chatbotapp/screens/chat_screen.dart';
import 'package:chatbotapp/screens/profile_screen.dart';
import 'package:chatbotapp/widgets/gradient_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  final String _text = '👋 Hello, Priyanshu !!';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duration of the animation
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: _text.length).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

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
              backgroundImage: AssetImage('assets/images/gemini2.png'),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10.0),
                child: Text(
                  'Gemini Chat',
                  style: GoogleFonts.cabin(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
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
              Column(
                children: [
                  Text(
                    _text.substring(0, _animation.value),
                    style: GoogleFonts.cabin(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    '     Welcome to Gemini',
                    style: GoogleFonts.cabin(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'How can I help you today ?',
                  style: GoogleFonts.cabin(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 39,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              const SizedBox(height: 50),
             Padding(
               padding: const EdgeInsets.only(left:25.0,bottom: 50, top: 10),
               child: InkWell(
                  onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => const ChatHistoryScreen()),
                         );
                       },
                 child: Container(
                   width: MediaQuery.of(context).size.width * 0.81,
                   height: MediaQuery.of(context).size.width * 0.17,
                   decoration: BoxDecoration(
                     color: Theme.of(context).cardColor,
                     borderRadius: BorderRadius.circular(50),
                     border: Border.all(
                       color: Theme.of(context).textTheme.titleLarge!.color!,
                       width: 2,
                     ),
                     boxShadow: [
                       const BoxShadow(
                         color: Colors.black,
                         blurRadius: 2,
                         spreadRadius: 1,
                         offset: Offset(0, 2),
                       ),
                     ],
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/images/image 2.png'),
                       Text(
                         'History',
                         style: GoogleFonts.cabin(
                           fontSize: 35,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
              Padding(
               padding: const EdgeInsets.only(left:25.0,bottom: 50),
               child: InkWell(
                  onTap: () {
                           _showComingSoonSnackBar(context);
                       },
                 child: Container(
                   width: MediaQuery.of(context).size.width * 0.81,
                   height: MediaQuery.of(context).size.width * 0.17,
                   decoration: BoxDecoration(
                     color: Theme.of(context).cardColor,
                     borderRadius: BorderRadius.circular(50),
                     border: Border.all(
                       color: Theme.of(context).textTheme.titleLarge!.color!,
                       width: 2,
                     ),
                     boxShadow: [
                       const BoxShadow(
                         color: Colors.black,
                         blurRadius: 2,
                         spreadRadius: 1,
                         offset: Offset(0, 2),
                       ),
                     ],
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/images/image 3.png'),
                       Text(
                         ' AI Voice',
                         style: GoogleFonts.cabin(
                           fontSize: 35,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:25.0,bottom: 50),
               child: InkWell(
                  onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => const ChatScreen()),
                         );
                       },
                 child: Container(
                   width: MediaQuery.of(context).size.width * 0.81,
                   height: MediaQuery.of(context).size.width * 0.17,
                   decoration: BoxDecoration(
                     color: Theme.of(context).cardColor,
                     borderRadius: BorderRadius.circular(50),
                     border: Border.all(
                       color: Theme.of(context).textTheme.titleLarge!.color!,
                       width: 2,
                     ),
                     boxShadow: [
                    const    BoxShadow(
                         color: Colors.black,
                         blurRadius: 2,
                         spreadRadius: 1,
                         offset:  Offset(0, 2),
                       ),
                     ],
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     
                       Text(
                         'Let’s Start  ',
                         style: GoogleFonts.cabin(
                           fontSize: 35,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                         Image.asset('assets/images/Vector.png', scale: 0.7,),
                     ],
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
    final snackBar = SnackBar(
      
      content: Text(
             "Coming soon",
                         style: GoogleFonts.cabin(
                           fontSize: 17,
                           fontWeight: FontWeight.w400,
                           color: Colors.black
                         ),
                       ),
      duration: Duration(seconds: 1),
      
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget getAppBarGradientContainer(BuildContext context) {
  return const Stack(
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
