

import 'package:dio/dio.dart';
import 'package:yoda_fl/models/prompt.dart';
import 'package:yoda_fl/utils/constants.dart';

class PromptService {


  // prompts the YODA AI Chatbot
  static Future<Prompt?> prompt(String prompt) async {
    final dio = Dio();

    try {
      Response response = await dio.post(serverURL, data: { 'prompt': prompt, });
      print("result is ==>");
      print(response.data.toString());
      print("result is ==>");
      
      // we are out of tokens
      if( response.statusCode != 200 ) {

        return null;
      }

      // decode response to text
      Prompt pmpt = Prompt.fromJson(response.data);
      print("got prompt info");
      print(pmpt.reply);

      return pmpt;
    } catch (e) {
      
      print("error occured while prompting with Yoda");
      print(e.toString());

      throw Exception(e);
    }
  }

}
