import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoda_fl/providers/prompt.dart';

class PromptForm extends StatefulWidget {
  final Function onAdd;
  const PromptForm({super.key, required this.onAdd});

  @override
  State<PromptForm> createState() => _PromptFormState();
}

class _PromptFormState extends State<PromptForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController(text: "");

  String _prompt = "";

  PromptProvider? _promptProvider;

  @override
  Widget build(BuildContext context) {
    _promptProvider = Provider.of<PromptProvider>(context);

    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _textEditingController,
        enabled: true,
        decoration: InputDecoration(
          suffix: Consumer<PromptProvider>(
            builder: (context, value, child) {

              if( value.isLoading ) {

                return const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                    strokeWidth: 2,
                  ),
                );
              } else {

                return IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _submitPrompt,
                );
              }
            },
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'I\'m Holmes... Ask me anything.',
          hintText: 'What is your name?',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onSaved: (val)=> setState(()=> _prompt = val!),
        onFieldSubmitted: (val) {
          setState(()=> _prompt = val!);
          _submitPrompt();
        },
        validator: (val)=> _promptValidator(val),
      ),
    );
  }


  _submitPrompt() async {
    print("ask holmes");

    if (_formKey.currentState!.validate()) {
      print('form is valid');
      _formKey.currentState!.save();

      try {
        await _promptProvider!.submitPrompt(prompt: _prompt);
        widget.onAdd();
        setState(()=> _prompt = "");
        _textEditingController.text = "";
      } catch (error) {
        print('widget error');
        print(error.toString());
      }
    }

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