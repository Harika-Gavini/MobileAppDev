import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  bool _isFirstImage = true;

  final String _image1 = 'images/hello.png';
  final String _image2 = 'images/bye.jpeg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _isFirstImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            // Increment button above the text widget
            Tooltip(
              message: 'Increment',
              child: ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 10), // Add space between text and count
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text(' times.', style: TextStyle(fontSize: 24)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 600, // Set a fixed width
              height: 270, // Set a fixed height
              child: Image(
                image: AssetImage(_isFirstImage ? _image1 : _image2),
                fit: BoxFit.contain, // Ensure the image fits in the space
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Text('Failed to load image', style: TextStyle(fontSize: 18));
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Toggle Image'),
                SizedBox(width: 10),
                Switch(
                  value: _isFirstImage,
                  onChanged: (value) {
                    _toggleImage();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _reset,
              icon: Icon(Icons.refresh),
              label: Text('Reset'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
        ),
      )
    );
  }
}