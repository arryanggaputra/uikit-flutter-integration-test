import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdailymotion/DailymotionPlayer/DailymotionPlayerController.dart';
import 'package:flutterdailymotion/DailymotionPlayer/DailymotionPlayerWidget.dart';

void main() {
  // SystemChrome .setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DailymotionPlayerController dmController;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();

    dmController =
        DailymotionPlayerController(videoId: "x8q4e1z", playerId: "xqzrc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
      body: Center(
        child: ListView(
          physics: _isFullScreen ? NeverScrollableScrollPhysics() : null,
          children: <Widget>[
            DailymotionPlayerWidget(controller: dmController),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayButton(
                        onPressed: () => {
                              setState(() {
                                _isFullScreen = !_isFullScreen;
                              }),
                              dmController.setFullScreen(_isFullScreen)
                            }),
                    PauseButton(onPressed: () => dmController.pause()),
                    ElevatedButton(
                      onPressed: () {
                        dmController.load('x8o3icz');
                      },
                      child: const Text(
                        'Load x8o3icz',
                      ),
                    )
                  ],
                ),
                const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      // iconSize: 64.0,
      onPressed: onPressed,
    );
  }
}

class PauseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PauseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.pause),
      // iconSize: 64.0,
      onPressed: onPressed,
    );
  }
}
