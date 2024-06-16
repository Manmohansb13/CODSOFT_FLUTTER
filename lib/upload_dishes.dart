import 'package:cloud_firestore/cloud_firestore.dart';

List<Map<String, dynamic>> popularDishes = [
  {
    "name": "Pizza",
  },
  {
    "name": "Paneer Butter Masala",
  },
  {
    "name": "Sushi",
  },
  {
    "name": "Tacos",
  },
  {
    "name": "Pad Thai",
  },
  {
    "name": "Burger",
  },
  {
    "name": "Falafel",
  },
  {
    "name": "Pasta Carbonara",
  },
  {
    "name": "Biryani",
  },
  {
    "name": "Croissant",
  },
  {
    "name": "Samosa",
  },
  {
    "name": "French Fries",
  },
  {
    "name": "Cake",
  }
];

Future<void> uploadInitialData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference dishes = firestore.collection('dishes');

  for (Map<String, dynamic> dish in popularDishes) {
    await dishes.add(dish);
  }
}
