import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:users_sql/User.dart';
import 'database_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
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
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
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
                hintText: 'password',
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
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
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
                  //code for register a new user here

                  if(usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
                    Toast.show('Please fill all fields',context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
                    return;
                  }
                  if(passwordController.text != confirmController.text ) {
                    Toast.show('password not matches', context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    return;
                  }

                  DatabaseProvider.db.insertUser(
                      User(
                        userName: usernameController.text,
                        email: emailController.text,
                        password:passwordController.text,
                      )
                  );


                },
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
