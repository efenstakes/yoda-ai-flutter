import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoda_fl/providers/prompt.dart';
import 'package:yoda_fl/screens/home/screen.dart';
import 'package:yoda_fl/screens/onboarding/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? hasOnboarded = prefs.getBool("HAS::ONBOARDED");
  runApp(MyApp(hasOnboarded: hasOnboarded ?? false));
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final hasOnboarded;
  const MyApp({super.key, required this.hasOnboarded});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<PromptProvider>(
          create: (_) => PromptProvider(),
        ),

      ],
      child: MaterialApp(
        title: 'Yoda AI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: hasOnboarded ? const HomeScreen() : const OnboardingScreen()
      ),
    );
  }
}
