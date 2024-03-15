import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter app',
      home: HomePage(),
    ),
  );
}

StoryBrain storyBrain = StoryBrain();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Expanded(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                  height: 75,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      child: Text(storyBrain.getChoice1()))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: SizedBox(
                    height: 75,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        child: Text(storyBrain.getChoice2()))),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
