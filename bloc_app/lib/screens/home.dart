import 'package:bloc_app/delegades/data_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/youtube_logo.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          const Align(alignment: Alignment.center,
          child: Text("0"),),
          IconButton(onPressed: (){}, icon: Icon(Icons.star)),
          IconButton(onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          }, icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Text("Salve")
      ),
    );
  }
}
