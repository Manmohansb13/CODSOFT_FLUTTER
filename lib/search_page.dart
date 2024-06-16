import 'package:flutter/material.dart';
import 'package:recipe_app/Recipies/recipie.dart';
import 'package:recipe_app/recipe_page_file.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Recipie> subjects=allRecipie;


  //Search subject
  void searchSubject(String query){
    final suggestions=allRecipie.where((subject){
      final subjectTitle=subject.name.toLowerCase();
      final input=query.toLowerCase();
      return subjectTitle.contains(input);
    }).toList();
    setState(() {
      subjects=suggestions;
    });
  }



  final _searchController=TextEditingController();
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
                  )
              ),
              onChanged: searchSubject,
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder:(context,index){
                  final subject=subjects[index];
                  return ListTile(
                    onTap: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Route to subject Page
                            builder: (context)=>RecipiePage(name: subject),
                        )
                    ),
                    title: Text(subject.name),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              )
          ),
        ],
      ),
    );

  }
}