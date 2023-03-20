import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'View/SecondPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
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
  bool flag = false;
  TextEditingController question_controller = TextEditingController();
  int groupValue = -1;
  Future addQuestions() async {
    await FirebaseFirestore.instance.collection('question').add({
      'question': question_controller.text.trim(),
      'answer': groupValue == 0 ? true : false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: question_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type your question here',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('True'),
                  Radio(
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as int;
                      });
                    },
                  ),
                  const Text('False'),
                  Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as int;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    addQuestions();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SecondPage())));
                  },
                  child: const Text('Submit')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SecondPage())));
                  },
                  child: const Text('Submitted Questions'))
            ],
          ),
        ),
      ),
    );
  }
}
