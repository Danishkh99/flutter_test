import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondPage extends StatefulWidget {
  var index1;
  SecondPage({super.key, this.index1});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // productList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height / 3,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    image: DecorationImage(
                        image:
                            NetworkImage(widget.index1['image'].toString()))),
              ),
              Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline_outlined))),
            ],
          ),
          Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 25, right: 25, top: 25),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.index1['title'].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      widget.index1['price'].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xff5534A5)),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "(with solo app)",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "colors",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width / 3.5,
                      height: size.height / 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xffDA7777),
                            ),
                            Text(
                              "cholk pink",
                              style: TextStyle(color: Colors.black54),
                            )
                          ]),
                    ),
                    Container(
                      width: size.width / 3.5,
                      height: size.height / 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xffEB55C1),
                            ),
                            Text(
                              "light pink",
                              style: TextStyle(color: Colors.black54),
                            )
                          ]),
                    ),
                    Container(
                      width: size.width / 3.5,
                      height: size.height / 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xff676060),
                            ),
                            Text(
                              "dark order",
                              style: TextStyle(color: Colors.black54),
                            )
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Text("Details",
                        style: TextStyle(color: Colors.black87, fontSize: 15)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Reviews",
                        style: TextStyle(color: Colors.black87, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "What is a case study? A case study is a research approach that is used to generate an in-depth, multi-faceted understanding of a complex issue in its real-life context. It is an established research design that is used extensively in a wide variety of disciplines",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to cart",
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
