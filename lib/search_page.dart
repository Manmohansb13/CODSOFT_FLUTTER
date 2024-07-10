import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/recipe_page_file.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> allDishes = [];
  List<Map<String, dynamic>> filteredDishes = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDishes();
  }

  Future<void> fetchDishes() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dishesRef = firestore.collection('dishes');

    QuerySnapshot querySnapshot = await dishesRef.get();
    setState(() {
      allDishes = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      filteredDishes = allDishes;
    });
  }

  void searchDishes(String query) {
    final suggestions = allDishes.where((dish) {
      final dishName = dish['name'].toString().toLowerCase();
      final input = query.toLowerCase();
      return dishName.contains(input);
    }).toList();
    setState(() {
      filteredDishes = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textCapitalization: TextCapitalization.words,
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Recipe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: searchDishes,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDishes.length,
              itemBuilder: (context, index) {
                final dish = filteredDishes[index];
                return ListTile(
                  title: Text(dish['name']),
                  trailing: Icon(Icons.arrow_forward_ios),

                  onTap: () {
                    String n=dish['name'];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipiePage(name: n),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
