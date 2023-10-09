import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:yoda_fl/models/prompt.dart';
import 'package:yoda_fl/providers/prompt.dart';
import 'package:yoda_fl/widgets/no_prompts.dart';
import 'package:yoda_fl/widgets/prompt_card.dart';
import 'package:yoda_fl/widgets/prompt_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yoda AI"),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: size.height,
        child: Consumer<PromptProvider>(
          builder: (ctx, PromptProvider promptProvider, child) {
            
            return Stack(
              children: [


                // when we have prompts
                if( promptProvider.prompts.isNotEmpty )
                  SizedBox(
                    height: size.height * .8,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: promptProvider.prompts.length,
                      itemBuilder: (_, i)=> PromptCard(prompt: promptProvider.prompts[i]),
                    ),
                  ),
        
                if( promptProvider.error != null )
                  Positioned(
                    top: 12,
                    left: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange[700],
                        borderRadius: const BorderRadius.all(Radius.circular(6))
                      ),
                      child: Text(
                        promptProvider.error == ErrorType.server ? "A server error occurred. Please try again" : "Seems like Yoda is tired and out of tokens. He's gone to rest now.",
                      ),
                    ),
                  ),
                
                // when no prompts
                if( promptProvider.prompts.isEmpty )
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.center,
                      child: NoPromptsCard(),
                    ),
                  ),
          
                // prompt input
                Positioned(
                  bottom: 24,
                  left: 0,
                  width: size.width,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.white.withOpacity(.9),
                    // height: 56,
                    child: PromptForm(onAdd: _onAddPrompt),
                  ),
                ),
      
              ],
            );
          },
        ),
      ),
    );
  }


  // scroll to bottom of list
  _onAddPrompt() async {
      print("scroll to bottom of list ");

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 1),
        curve: Curves.fastOutSlowIn
      );
  }


}