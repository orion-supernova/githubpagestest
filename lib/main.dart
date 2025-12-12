import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Lucky Page', // This is for the browser tab title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(), // Removed title from here
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // Removed required title

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Register the IFrame if it's not already registered
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'youtube-video',
      (int viewId) => IFrameElement()
        ..width = '560'
        ..height = '315'
        ..src = 'https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1&enablejsapi=1'
        ..allow = 'autoplay; encrypted-media; fullscreen'
        ..setAttribute('allowfullscreen', 'true')
        ..setAttribute('frameborder', '0')
        ..style.border = 'none',
    );

    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Pleasant background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'If you\'re seeing this, test is successfull',
                style: Theme.of(context).textTheme.headlineMedium, // Larger font
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your lucky number is: 42',
                style: Theme.of(context).textTheme.headlineSmall, // Slightly smaller than above
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30), // More space before video
            SizedBox(
              width: 560,
              height: 315,
              child: HtmlElementView(viewType: 'youtube-video'),
            ),
          ],
        ),
      ),
    );
  }
}
