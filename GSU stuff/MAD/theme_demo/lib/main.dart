import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(31, 82, 77, 77),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        ),
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(toggleTheme: toggleTheme),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo for Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor == Colors.deepPurpleAccent
                    ? Colors.grey
                    : Colors.white,
                borderRadius: BorderRadius.circular(75),
              ),
              alignment: Alignment.center,
              child: Text(
                'Mobile App Development Testing',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: toggleTheme,
              child: Text(
                Theme.of(context).scaffoldBackgroundColor == Colors.deepPurpleAccent
                    ? 'Switch Theme to Light'
                    : 'Switch Theme to Dark',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).scaffoldBackgroundColor == Colors.deepPurpleAccent
                    ? Colors.black
                    : Colors.deepPurpleAccent,
                  elevation: 2,
                  backgroundColor:Theme.of(context).scaffoldBackgroundColor == Colors.deepPurpleAccent
                    ? Colors.grey
                    : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}