import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Recipies/recipie.dart';


class RecipiePage extends StatefulWidget {
  final String name;
  const RecipiePage({super.key,required this.name});

  @override
  State<RecipiePage> createState() => _RecipiePageState();
}

class _RecipiePageState extends State<RecipiePage> {
  final _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),// Example: Beige/Cream

      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Recipe").doc(widget.name).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            final recipiedata=snapshot.data!.data() as Map<String,dynamic>;
            String steps = recipiedata["Steps"].replaceAll("\\\\n", "\n").replaceAll("\\", "");
            String ingredients=recipiedata["Ingredients"].replaceAll("\\\\n", "\n").replaceAll("\\", "");
            return  Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  Text("INGREDIENTS",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                  Text(ingredients,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("STEPS",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                  Text(steps,style: TextStyle(fontSize: 18),),
                ],
              ),
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