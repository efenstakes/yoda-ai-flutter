import 'package:flutter/material.dart';
import 'package:yoda_fl/models/prompt.dart';
import 'package:yoda_fl/services/prompt.dart';


enum ErrorType { outOfTokens, server }
class PromptProvider with ChangeNotifier {
  bool isLoading = false;
  ErrorType? error;
  List<Prompt> prompts = [];
  

  // submit prompt
  Future<void> submitPrompt({required String prompt}) async {
    isLoading = true;
    error = null;

    try {
      // make api request to our api
      // String reply = "Reply to $prompt";
      Prompt? promptReply = await PromptService.prompt(prompt);
      
      // if data is null, we have an error
      if( promptReply == null ) {

        isLoading = false;
        error = ErrorType.outOfTokens;
        notifyListeners();
        return;
      }

      // add it to state
      prompts.add(promptReply);
      isLoading = false;
    
    } catch (e) {
      
      error = ErrorType.server;
      print("error getting prompt");
      print(e);
    }

    notifyListeners();
  }
  
}