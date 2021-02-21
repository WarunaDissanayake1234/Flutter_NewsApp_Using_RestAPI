import 'package:Rest_API/Services/api_manager.dart';
import 'package:Rest_API/models/newsinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {


  @override
void initState() {
  var response = API_Manager().getNews();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.yellow,
            );
          },
        ),
      ),
    );
  }
}
