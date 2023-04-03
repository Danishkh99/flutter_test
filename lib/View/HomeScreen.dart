import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/View/SecondPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  var productList;

  Future<void> allProducts() async {
    var mytemp = await FirebaseFirestore.instance.collection('/product').get();
    List<Map<String, dynamic>> list1 =
        mytemp.docs.map((doc) => doc.data()).toList();
    productList = list1;
    setState(() {
      print(productList);
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    allProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color(0xffECF6F6),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              size: 40,
                            )),
                        Container(
                          width: size.width * 0.6,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "search product",
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("find your suitable watch now.",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: AppBar(
                        backgroundColor: Color(0xffECF6F6),
                        bottom: TabBar(
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.blue,
                          controller: _tabController,
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.all(5),
                          tabs: <Widget>[
                            Container(
                              width: 100.0,
                              child: Tab(text: 'Smart Watch'),
                            ),
                            Tab(text: "Casio"),
                            const Tab(
                              text: "Tisto",
                            ),
                            Tab(
                              text: "Siko",
                            )
                          ],
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.blue,
                        ),
                        elevation: 0,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20),
                            child: (productList != null)
                                ? Container(
                                    child: GridView.count(
                                      crossAxisCount: (2),
                                      mainAxisSpacing: 20.0,
                                      childAspectRatio:
                                          size.width / (size.height / 1.6),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: List.generate(
                                        productList.length,
                                        (index) => Container(
                                          height: size.height * 0.5,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SecondPage(
                                                          index1: productList[
                                                              index],
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              height: size.height * 0.25,
                                              margin: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      height: 130,
                                                      alignment:
                                                          Alignment.topCenter,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              productList[index]
                                                                      ['image']
                                                                  .toString()),
                                                          // fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      productList[index]
                                                          ['title'],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Text(
                                                      productList[index]
                                                          ['series'],
                                                      style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Text(
                                                      productList[index]
                                                          ['price'],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                          ),
                          Center(child: Text("Page 2")),
                          Center(child: Text("Page 1")),
                          Center(child: Text("Page 2")),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
