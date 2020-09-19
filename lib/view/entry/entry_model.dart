import 'package:flutter/material.dart';
import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/models/product.dart';
import 'package:sqlitebase/models/supplier.dart';
import 'package:sqlitebase/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EntryModel extends BaseViewModel {
  DB _database = locator<DB>();
  DialogService _dialogService = locator<DialogService>();
  PageController controller;
  double page;

  Customer customerData;
  Product productData;
  Supplier supplierData;

  EntryModel({this.controller}) {
    controller.addListener(() {
      page = controller.page;
      notifyListeners();
    });
  }

  submitInformation(Product product, BuildContext context) async {
    productData = product;
    setBusy(true);
    if (await _database.createBatchOperation(
        customerData, supplierData, product))
      print('succeed');
    else
      print('false');

    setBusy(false);
    await Navigator.pop(context);

    // await _database.onCreate(_database.myDB,_database.version);

//    await _database.createCustomer(Customer(email: 'sdf',id:int.parse('2'),firstName: 'sdf',lastName: 'sdfsd'))
//   .then((value){
//      print('done');
//      //  _dialogService.showDialog(title:'done');
//   });
// }
  }

  changePage(int index, var object) {
    if (object is Customer) customerData = object;
    if (object is Product) productData = object;
    if (object is Supplier) supplierData = object;

    controller.jumpToPage(index);
    notifyListeners();
  }

  validateInput(var value) {
    if (value != null)
      return null;
    else
      return 'found empty';
  }
}
