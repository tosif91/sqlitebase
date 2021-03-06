import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/models/supplier.dart';
import 'package:sqlitebase/view/entry/entry_model.dart';

class SupplierPage extends StatelessWidget {
  int id;
  String name;
  String gst;
  String pan;
  String address;
  String state;
  String pinCode;
  String emailID;
  String contactNumber;
  EntryModel model;
  SupplierPage({this.model});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Supplier'),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType
                    .emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(labelText: 'id here'),
                textInputAction: TextInputAction.next,
                validator: (value) => model.validateInput(value.trim()),
                onSaved: (value) => id = int.parse(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: new InputDecoration(labelText: 'supplier name'),
                validator: (value) => model.validateInput(value.trim()),
                textInputAction: TextInputAction.next,
                onSaved: (value) => name = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: new InputDecoration(labelText: 'gst number'),
                  validator: (value) => model.validateInput(value.trim()),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => gst = value.trim()),
            ),
          
        (model.isBusy)
                      ?CircularProgressIndicator()
                      :FlatButton(
                        child: const Text(
                          'save Supplier',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await model.changePage(2, Supplier(name: name,gst: gst,id:id));
                          }
                        },
                                                         color: Colors.lightBlue
                      ),
      
          ])),
    );
  }
}
