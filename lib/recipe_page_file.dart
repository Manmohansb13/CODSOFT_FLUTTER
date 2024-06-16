import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Recipies/recipie.dart';


class RecipiePage extends StatefulWidget {
  final Recipie name;
  const RecipiePage({super.key,required this.name});

  @override
  State<RecipiePage> createState() => _RecipiePageState();
}

class _RecipiePageState extends State<RecipiePage> {
  final _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.name),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Recipe").doc(widget.name.name).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            final recipiedata=snapshot.data!.data() as Map<String,dynamic>;
            String steps = recipiedata["Steps"].replaceAll("\\\\n", "\n").replaceAll("\\", "");
            return ListView(
              children: [
                Text(recipiedata["Ingredients"]),

                Text(steps),
              ],
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Text("Error"),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}