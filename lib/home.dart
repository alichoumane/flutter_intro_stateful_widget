import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';
  double _x = -1;
  double _y = -1;

  String _image = "assets/image1.jpg";
  List<String> _images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.png'
  ];

  static int counter = 1;

  void updateText(){
    setState(() {
      if (_x == -1 || _y == -1) {
        _text = 'Please fill all fields';
      }
      else {
        _text = "Sum = " + (_x + _y).toString();
        _image = _images[(counter++) % _images.length];

      }
    });
  }

  void updateX(String x){
    if (x.trim() == '') {
      _x = -1;
    }
    else {
      _x = double.parse(x);
    }
  }

  void updateY(String y){
    if (y.trim() == '') {
      _y = -1;
    }
    else {
      _y = double.parse(y);
    }
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
            Text('$_text',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height:20.0),
            MyTextField(f: updateX, hint: "Enter X"),
            const SizedBox(height:20.0),
            MyTextField(f: updateY, hint: "Enter Y"),
            const SizedBox(height:20.0),
            Container(
              margin: EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: (){updateText();},
                  child: Text("Sum", style: TextStyle(fontSize: 40),)
              ),
            ),
            Image.asset(_image, width: 250.0, height: 250.0),
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

