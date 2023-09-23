import 'package:flutter/material.dart';

class PromptForm extends StatefulWidget {
  const PromptForm({super.key});

  @override
  State<PromptForm> createState() => _PromptFormState();
}

class _PromptFormState extends State<PromptForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String _prompt = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: _submitPrompt,),
              labelText: 'I\'m Holmes... Ask me anything.',
              hintText: 'What is your name?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onSaved: (val)=> setState(()=> _prompt = val!),
            validator: (val)=> _promptValidator(val),
          ),
    );
  }


  _submitPrompt() {
    print("ask holmes");
  }

  /*
   * data validators
   */
  String? _promptValidator(String? val) {
    if ( val == null ) return 'You should enter a prompt to proceed';

    val = val.trim();
    if (val.isEmpty) return 'You should enter a prompt to proceed';
  }
}