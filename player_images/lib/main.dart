import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player Images',
      home: PlayersImg(),
    );
  }
}

class PlayersImg extends StatefulWidget {
  @override
  State<PlayersImg> createState() => _PlayersImgState();
}

class _PlayersImgState extends State<PlayersImg> {
  int count = 0;

  List<String> players = <String>[
    "https://cdn.britannica.com/25/222725-050-170F622A/Indian-cricketer-Mahendra-Singh-Dhoni-2011.jpg",
    "https://cdn.britannica.com/48/252748-050-C514EFDB/Virat-Kohli-India-celebrates-50th-century-Cricket-November-15-2023.jpg?w=300",
    "https://images.forbesindia.com/media/images/2024/Jul/img_236102_.jpg",
    "https://akm-img-a-in.tosshub.com/indiatoday/images/story/media_bank/202310/ravindra-jadeja-085315890-3x4.jpg?VersionId=_YsznuV80qR12W.JVFuI5D_W3e1rW2nw",
    "https://c.ndtvimg.com/2024-08/v2kdqi38_rishabh-pant-afp_625x300_16_August_24.jpg?im=FeatureCrop,algorithm=dnn,width=806,height=605",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players Images'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            players[count],
            height: 300,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (count < players.length - 1) {
              count++;
            } else {
              count = 0;
            }
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
