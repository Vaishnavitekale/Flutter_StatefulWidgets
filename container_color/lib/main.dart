import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container Color Change',
      home: ContainerColorApp(),
    );
  }
}

class ContainerColorApp extends StatefulWidget {
  const ContainerColorApp({super.key});

  @override
  State<ContainerColorApp> createState() => _ContainerColorAppState();
}

class _ContainerColorAppState extends State<ContainerColorApp> {
  bool colorChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container Color Change'),
          centerTitle: true,
          backgroundColor: colorChange ? Colors.blue : Colors.yellow,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: colorChange ? Colors.red : Colors.black,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (colorChange == true) {
              colorChange = false;
            } else {
              colorChange = true;
            }
            setState(() {});
          },
          child: const Icon(Icons.add),
        ));
  }
}
