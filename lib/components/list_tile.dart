import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyListView extends StatelessWidget {
  final String dishName;
  final String gifFile;

  const MyListView({
    Key? key,
    required this.dishName,
    required this.gifFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Example background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 200, // Adjust height as needed
              width: 120,
              child: Lottie.asset(
                gifFile,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            dishName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
