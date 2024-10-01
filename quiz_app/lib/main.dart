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
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Larry Page",
        "Elon Musk"
      ],
      "correctAnswer": 1
    },
    {
      "question": "Who is the founder of SpaceX?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Larry Page",
        "Elon Musk"
      ],
      "correctAnswer": 3
    },
    {
      "question": "Who is the founder of Google?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Larry Page",
        "Elon Musk"
      ],
      "correctAnswer": 2
    },
    {
      "question": "Who is the founder of Meta?",
      "options": [
        "Steve Jobs",
        "Mark Zuckerberg",
        "Larry Page",
        "Elon Musk"
      ],
      "correctAnswer": 1
    },
    {
      "question": "Who is the founder of Apple?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Larry Page",
        "Elon Musk"
      ],
      "correctAnswer": 0
    }
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnswerCount = 0;
  bool clickCheck = true;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  void increaseCount() {
    if (selectedAnswerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
      correctAnswerCount++;
    }
  }

  bool questionPage = true;

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quiz App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.orange,
              )),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Text("Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 380,
                height: 50,
                child: Text(allQuestions[currentQuestionIndex]["question"],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ))),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 0;
                      increaseCount();
                      setState(() {});
                    }
                  },
                  child: Text(allQuestions[currentQuestionIndex]['options'][0],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 1;
                      increaseCount();
                      setState(() {});
                    }
                  },
                  child: Text(allQuestions[currentQuestionIndex]['options'][1],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 2;
                      increaseCount();
                      setState(() {});
                    }
                  },
                  child: Text(allQuestions[currentQuestionIndex]['options'][2],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    increaseCount();
                    setState(() {});
                  }
                },
                child: Text(allQuestions[currentQuestionIndex]['options'][3],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex == -1) {
              clickCheck == false;
              setState(() {});
            } else {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(
                () {},
              );
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Result",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.orange,
              )),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.network("https://img.freepik.com/free-vector/trophy-flat-style_78370-3222.jpg?size=338&ext=jpg&ga=GA1.1.1819120589.1727481600&semt=ais_hybrid"),
              Text(
                "Total Score : $correctAnswerCount",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
