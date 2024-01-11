import 'package:allevents/helper/getCategory.dart';
import 'package:allevents/models/category_models.dart';
import 'package:allevents/pages/EventListing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = <CategoryModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCatagory();
  }

  getCatagory() async {
    CategoryHelper categoryHelper = CategoryHelper();
    categories = await categoryHelper.getCategory();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading
            ? Center(
                child: Container(
                  child: const CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          ),
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: ListView.builder(
                              itemCount: categories.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      child: Chip(
                                        label: Text(
                                          categories[index].category,
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                        backgroundColor: Colors.white,
                                        elevation: 4,
                                        shadowColor: Colors.grey[50],
                                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        shape: const StadiumBorder(),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EventListing(
                                                      title: categories[index].category,
                                                      data: categories[index].data,
                                                    )));
                                      },
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
