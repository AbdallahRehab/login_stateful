import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey=GlobalKey<FormState>();

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 25.0),),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'EmailAddress',
        hintText: 'you@example.com'
      ),
      validator: validateEmail ,
      onSaved: (String value){
        print(value);
        email=value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      //obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password'
      ),
      validator: validatePassword,

      onSaved: (String value){
        print(value);
        password=value;
      },
    );
  }
  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('sdsd $email and $password');
        }
        //print(formKey.currentState.validate());
      },
    );
  }
}
