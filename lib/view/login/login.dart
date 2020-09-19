import 'package:flutter/material.dart';
import 'package:sqlitebase/view/login/login_model.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: ()=>LoginModel(),
            builder:(context,model,_)=> Container(
          child: Center(
            child: 
            (model.isBusy)
            ?CircularProgressIndicator()
            :FlatButton(child: Text('signIn'),onPressed:()=>model.signIn()),
          ),
        ),
      ),
    );
  }
}