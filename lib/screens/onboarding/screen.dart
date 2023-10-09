import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoda_fl/screens/home/screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Introduction> list = [
    Introduction(
      title: 'Dream',
      subTitle: 'Welcome to the world of possibilities. This is where your dreams take flight',
      imageUrl: 'assets/images/istockphoto-1301055685-612x612.jpg',
    ),
    Introduction(
      title: 'Ideate',
      subTitle: 'Brainstorm, refine, and organize your thoughts with the help of our AI tools. Your next big innovation starts here.',
      imageUrl: 'assets/images/5287960.jpg',
    ),
    Introduction(
      title: 'Build',
      subTitle: 'Our AI-powered features will be your trusty companions on this journey to manifest your vision.',
      imageUrl: 'assets/images/2119508.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: skip,
    );
  }

  skip() async {
    print("skip now");
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("HAS::ONBOARDED", true);

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ), //MaterialPageRoute
    );
  }
}
