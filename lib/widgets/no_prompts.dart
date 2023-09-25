import 'package:flutter/material.dart';

class NoPromptsCard extends StatefulWidget {
  const NoPromptsCard({super.key});

  @override
  State<NoPromptsCard> createState() => _NoPromptsCardState();
}

class _NoPromptsCardState extends State<NoPromptsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(maxHeight: 160),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "No Prompt",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            "You have not asked my anything in this thread yet. I am Yoda, Yoda AI, consider me to be your personal assistant.",
            // style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}