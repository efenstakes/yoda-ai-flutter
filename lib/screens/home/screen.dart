import 'package:flutter/material.dart';
import 'package:yoda_fl/models/prompt.dart';
import 'package:yoda_fl/widgets/no_prompts.dart';
import 'package:yoda_fl/widgets/prompt_card.dart';
import 'package:yoda_fl/widgets/prompt_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Prompt> _prompts = [
    Prompt(
      prompt: "Hola",
      reply: "Hola"
    ),
    Prompt(
      prompt: "How are you doing",
      reply: "Just ask something"
    ),
    Prompt(
      prompt: "Hola",
      reply: "Hola"
    ),
    Prompt(
      prompt: "Hola",
      reply: "Hola"
    ),
    Prompt(
      prompt: "Hola",
      reply: "Hola"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Holmes AI"),
        centerTitle: true,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: size.height,
        child: Stack(
          children: [
      
            // when we have prompts
            if( _prompts.isNotEmpty )
              ListView(
                children: _prompts.map((prompt) {
                  
                  return PromptCard(prompt: prompt);
                }).toList(),
              ),
        
            // when no prompts
            if( _prompts.isEmpty )
              const Padding(
                padding: EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.center,
                  child: NoPromptsCard(),
                ),
              ),
      
            // prompt input
            Positioned(
              bottom: 0,
              left: 0,
              width: size.width,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white.withOpacity(.5),
                height: 120,
                child: const PromptForm(),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}