import 'package:toast/toast.dart';

import 'database_provider.dart';
import 'standard_user.dart';
import 'admin_page.dart';
import 'package:flutter/material.dart';
import 'package:users_sql/User.dart';
import './database_provider.dart';
import './register_page.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.database;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'username',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[900], width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[900], width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  //your code for login here
                  if(usernameController.text =='admin' && passwordController.text=='admin123'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
                  }
                  else if(DatabaseProvider.db.getUser(usernameController.text, passwordController.text) !=null){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> StandardUser(usernameController.text, passwordController.text)));
                  }
                  else{
                    Toast.show('wrong user name or password',context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
                  }

                },
                child: Text('Login')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Register',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
