import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';

  void updateText(String text){
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
        body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Text('You typed $_text',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height:20.0),
            MyTextField(f: updateText, hint: "Enter some text")
          ],
        )
        )
    );
  }
}

class MyTextField extends StatelessWidget {
  Function(String) f;
  String hint;

  MyTextField({required this.f, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200, height:50.0,
      child: TextField(
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint
        ),
        onChanged: (text){f(text);},
      ),
    );
  }
}

