import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoda_fl/providers/prompt.dart';
import 'package:yoda_fl/screens/home/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const HomeScreen()
      ),
    );
  }
}
