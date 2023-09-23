import 'package:flutter/material.dart';
import 'package:yoda_fl/models/prompt.dart';


class PromptProvider with ChangeNotifier {
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
  

  // submit prompt
  void submitPrompt({required String prompt}) {
    
    try {
      // make api request to our api

    
    } catch (e) {
      
    }

    notifyListeners();
  }
  
}