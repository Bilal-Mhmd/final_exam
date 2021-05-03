
import 'package:users_sql/User.dart';

import 'database_provider.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Column(
        children:[
          Text('admin@gmail.com'),
          FutureBuilder(
            future: DatabaseProvider.db.users,
            builder: (context, snapshot){
              if(snapshot.hasData){
                List<User> users = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context,int index) {
                      return Container(
                        margin: EdgeInsets.all(2.0),
                        color: Colors.blue[200],
                        child: GestureDetector(
                          onHorizontalDragCancel:(){
                            DatabaseProvider.db.deleteUser(users[index].id);
                            setState(() {
                            });
                          },
                          child: ListTile(

                            onLongPress: (){
                              DatabaseProvider.db.updateUser(users[index]);
                              setState(() {

                              });
                            },
                            contentPadding: EdgeInsets.symmetric(horizontal: 1),
                            leading: Text(
                              users.elementAt(index).userName,
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text('user Name: ${users[index].userName}'),

                      ),
                        )
                      );
                    },
                  ),
                );
              }
              else if(snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              else
                return CircularProgressIndicator();
            } ,

          ),
        ]
      ),//replace with your design
    );
  }
}
