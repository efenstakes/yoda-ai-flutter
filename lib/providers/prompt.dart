import 'package:flutter/material.dart';
import 'package:yoda_fl/models/prompt.dart';


class PromptProvider with ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  List<Prompt> prompts = [
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
  Future<void> submitPrompt({required String prompt}) async {
    isLoading = true;

    try {
      // make api request to our api
      String reply = "Reply to $prompt";
      
      // add it to state
      prompts.add(Prompt( prompt: prompt, reply: reply ));
    
    } catch (e) {
      
    }

    isLoading = false;
    notifyListeners();
  }
  
}