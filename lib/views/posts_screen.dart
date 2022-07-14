import 'package:api_demo/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../services/remote_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPostsData();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreen.shade400,
            title: Text('User Post Data'),
            centerTitle: true,
          ),
          body:ListView.builder(itemCount: posts?.length,
              itemBuilder: (context, index) {
                return
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.lightGreen.shade400,
                            ),
                            child: Center(
                              child: Text(
                                posts![index].id.toString(),
                                style: TextStyle(
                                    color: Colors.white,fontSize: 20
                                ),),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ID:- ' + posts![index].id.toString()
                                      + '\n' +
                                      'Title:-'+posts![index].title
                                      + '\n' +
                                      'User ID:-'+ posts![index].userId.toString()
                                      +'\n'
                                      + 'Body:-' + posts![index].body,
                                style: const TextStyle(
                                          fontSize: 15,color: Colors.green,
                                          height: 1.4)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]
                    ),
                  );
              })
      );
  }
}
