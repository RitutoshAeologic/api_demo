import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../services/remote_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    users = await RemoteService().getUserData();
    if (users != null) {
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
          title: Text('User Data'),
          centerTitle: true,
        ),
        body:ListView.builder(itemCount: users?.length,
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
                              users![index].id.toString(),
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
                                Text('ID:- ' + users![index].id.toString()
                                    + '\n' +
                                    'Name:-'+users![index].name.toString()
                                    + '\n' +
                                    'User Name:-'+ users![index].username.toString()
                                    +'\n'
                                    + 'Email:-' + users![index].email.toString()

                                    + '\n' + 'Address:-' + users![index].address!.street +', '
                                    + users![index].address!.city + '\n'
                                    + 'Zipcode:-'+ users![index].address!.zipcode
                                    + '\n' +
                                    'Phone No:-'+users![index].phone.toString()
                                    + '\n' + 'Website:-' + users![index].website.toString()
                                    + '\n' +
                                    'Company Name:-'+users![index].company!.name
                                    ,
                                    //maxLines: 2,
                                //    overflow: TextOverflow.ellipsis,
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
