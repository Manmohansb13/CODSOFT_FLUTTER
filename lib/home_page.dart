import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_app/components/list_tile.dart';
import 'package:recipe_app/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              color: Colors.black,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              ),
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF009688),

                ),
                child: LottieBuilder.asset("ass/Animation - 1718452218024.json"),

              ),
            ),
            SizedBox(height: 30,),
            Text("Popular Dishes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyListView(dishName: "Pizza", gifFile: "ass/pizza.json"),
                  MyListView(dishName: "Samosa", gifFile: "ass/samosa.json"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  MyListView(dishName: "French Fries", gifFile: "ass/french-fries.json"),

                  MyListView(dishName: "Cake", gifFile: "ass/pastry.json"),
                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyListView(dishName: "Pizza", gifFile: "ass/pizza.json"),
                  MyListView(dishName: "Samosa", gifFile: "ass/samosa.json"),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
