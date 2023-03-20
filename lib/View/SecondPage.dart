import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var questionList;
  var size;
  Future<void> getQuestion() async {
    var mytemp = await FirebaseFirestore.instance.collection('question').get();
    List<Map<String, dynamic>> list1 =
        mytemp.docs.map((doc) => doc.data()).toList();
    questionList = list1;
    size = await FirebaseFirestore.instance
        .collection('question')
        .snapshots()
        .length;
    setState(() {
      print(size);

      print(questionList);
    });
  }

  @override
  void initState() {
    getQuestion();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("question").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              padding: const EdgeInsets.only(top: 20.0),
              itemBuilder: (BuildContext context, int index) {
                var data1 = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(data1['question']),
                    subtitle: Text(data1['answer'].toString()),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
