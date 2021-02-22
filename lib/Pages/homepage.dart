import 'package:Rest_API/Services/api_manager.dart';
import 'package:Rest_API/models/newsinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> _newsWelcom;

  @override
  void initState() {
    _newsWelcom = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Container(
          child: FutureBuilder<Welcome>(
            future: _newsWelcom,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var articles = snapshot.data.articles[index];
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    articles.urlToImage,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 16,),
                            Flexible(
                            
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              

                              Text(articles.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),

                              Text(articles.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,)

                            ],)
                            //Image.network(articles.urlToImage),
                             ) ],
                        ),
                      );
                    });
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ));
  }
}
