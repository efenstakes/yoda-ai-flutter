import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoda_fl/models/prompt.dart';


enum PromptTileType { prompt, reply }
class PromptCard extends StatelessWidget {
  final Prompt prompt;
  const PromptCard({super.key, required this.prompt});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          // prompt
          PromptTile(text: prompt.prompt!, width: width * .9, type: PromptTileType.prompt,),
          
          // reply
          Align(
            alignment: Alignment.centerRight,
            child: PromptTile(
              text: prompt.reply!,
              width: width * .9,
              type: PromptTileType.reply,
            ),
          ),
    
        ],
      ),
    );
  }
}

class PromptTile extends StatelessWidget {
  final String text;
  final double width;
  final PromptTileType type;


  const PromptTile({super.key, required this.text, required this.width, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(6),
      width: width,
      decoration: BoxDecoration(
        color: type == PromptTileType.prompt ? Colors.blueGrey.shade100 : Color.fromARGB(255, 158, 223, 217),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: type == PromptTileType.prompt ? const Radius.circular(6) : const Radius.circular(12),
          bottomRight: type == PromptTileType.prompt ? const Radius.circular(12) : const Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // copy to clipboard
          if ( type == PromptTileType.reply )
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: text));
                },
                child: Icon(Icons.copy, size: 20, color: Colors.teal[900],),
              ),
            ),
          
          if ( type == PromptTileType.reply )
            const SizedBox(height: 12),

          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}