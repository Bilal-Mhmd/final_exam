import 'package:users_sql/User.dart';

import 'database_provider.dart';
import 'package:flutter/material.dart';

class StandardUser extends StatelessWidget {
  final String userName;
  final String password;
   Future<User> user() async{
    User user = await DatabaseProvider.db.getUser(this.userName, this.password);
    return user;
  }
  StandardUser(this.userName, this.password);
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: Container(
        child:
            FutureBuilder(
              future: user(),
              builder: (context, snapshot){
               if(snapshot.hasData){
                 User user = snapshot.data;
                 return Column(
                   children: [
                     Text('Welcome ${user.userName}'),
                     Text('email ${user.email}')
                   ],
                 );
               }

              } ,)
      )
      ,//replace with your design
    );
  }
}
