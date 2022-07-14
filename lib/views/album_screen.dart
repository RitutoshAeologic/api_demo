import 'package:flutter/material.dart';

import '../model/album_model.dart';
import '../services/remote_service.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<AlbumModel>? album ;


  var isLoaded = false;

  @override
  void initState() {

    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    album = await RemoteService().getAlbumData();
    if (album != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade400,
          title: Text('Album Data'),
          centerTitle: true,
        ),
        body:ListView.builder(itemCount: album?.length,
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
                              album![index].id.toString(),
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
                                Text('ID:- ' + album![index].id.toString()
                                    + '\n' +
                                   'Title:-'+album![index].title
                                   +'\n'+
                                    'AlbumId:-'+ album![index].albumId.toString()
                                + '\n' + 'Url:-' + album![index].url
                                    +'\n'
                                    + 'TbUrl:-' + album![index].thumbnailUrl,

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
