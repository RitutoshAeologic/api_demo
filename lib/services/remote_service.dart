
import 'package:api_demo/model/post_model.dart';
import 'package:api_demo/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../model/album_model.dart';

class RemoteService {
  Future<List<UserModel>?> getUserData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userModelFromJson(json);
    }
  }

  Future<List<AlbumModel>?> getAlbumData() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return albumModelFromJson(json);
    }
  }

  Future<List<PostModel>?> getPostsData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postModelFromJson(json);
    }
  }
}