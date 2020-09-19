import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/models/product.dart';
import 'package:sqlitebase/view/entry/entry_model.dart';

class ProductPage extends StatelessWidget {
  int id;
  String serviceCode;
  String hSCode;
  String name;
  String description;
  String image;
  String quantity;
  String minLimit;
  String cost;
  String waCost;
  String salePrice;
  String gst;

  EntryModel model;
  ProductPage({this.model});
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
                child: Text('Product'),
              ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType
                    .emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(labelText: 'HSN/SAC Code'),
                textInputAction: TextInputAction.next,
                validator: (value) => model.validateInput(value.trim()),
                onSaved: (value) => hSCode= value.trim(),
              ),
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
              decoration: new InputDecoration(labelText: 'product name'),
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
                ? CircularProgressIndicator()
                : FlatButton(
                    child: const Text(
                      'final submit',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await model.submitInformation(
                           
                            Product(
                              // cost: cost,
                              // description: description,
                              gst: gst,
                              // hSCode: hSCode,
                              id: id,
                              // image: image,
                              // minLimit: minLimit,
                              name: name,
                              // quantity: quantity,
                              // salePrice: salePrice,
                              // serviceCode: serviceCode,
                              // waCost: waCost,
                              ),context
                              );
                      }
                    },
                    color: Colors.lightBlue),
          ])),
    );
  }
}
