import "package:flutter/material.dart";

void main() {
  runApp(const AppbarColorApp());
}

class AppbarColorApp extends StatefulWidget {
  const AppbarColorApp({super.key});

  @override
  State<AppbarColorApp> createState() => _AppbarColorAppState();
}

class _AppbarColorAppState extends State<AppbarColorApp> {
  bool colorChange = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appbar Color Change',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Appbar Color Change'),
              backgroundColor: colorChange ? Colors.blue : Colors.orange,
              centerTitle: true,
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Change Appbar color")],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (colorChange == true) {
                    colorChange = false;
                  } else {
                    colorChange = true;
                  }
                });
              },
              child: const Icon(Icons.add),
            )));
  }
}
