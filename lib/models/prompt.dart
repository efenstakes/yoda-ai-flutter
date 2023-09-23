class Prompt {
  String? prompt;
  String? reply;

  Prompt({this.prompt, this.reply});

  Prompt.fromJson(Map<String, dynamic> json) {
    prompt = json['prompt'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    
    data['prompt'] = prompt;
    data['reply'] = reply;
    return data;
  }
}