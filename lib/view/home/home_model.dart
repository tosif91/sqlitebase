import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/models/product.dart';
import 'package:sqlitebase/models/supplier.dart';
import 'package:sqlitebase/services/db.dart';
import 'package:sqlitebase/services/my_drive.dart';
import 'package:sqlitebase/view/entry/entry.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeModel extends BaseViewModel {
  List<Mixer> _mixData = List<Mixer>();

  List<Mixer> get data => _mixData;

  DB _database = locator<DB>();
  DialogService _dialogService = locator<DialogService>();
  MyDrive _drive=locator<MyDrive>();

  fetchData() async {
    setBusy(true);
    notifyListeners();
    List<Customer> cdata = await _database
        .getCustomers()
        .then((value) => value.map((e) => Customer.fromMap(e)).toList());
    List<Supplier> sdata = await _database
        .getSuppliers()
        .then((value) => value.map((e) => Supplier.fromMap(e)).toList());
    List<Product> pdata = await _database
        .getProducts()
        .then((value) => value.map((e) => Product.fromMap(e)).toList());

    for (int i = 0; i < cdata.length; i++) {
      _mixData.add(Mixer(
          customerName: cdata[i].name,
          productName: pdata[i].name,
          supplierName: sdata[i].name));
    }
    cdata.clear();
    sdata.clear();
    pdata.clear();

    setBusy(false);
    notifyListeners();
  }

  refresh()async {
    await _database.generateCustomerCSV();
    // _mixData.clear();
    // fetchData();
    await _drive.uploadFileToGoogleDrive();
    notifyListeners();
  }

  addItems(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Entry()),
    );
  }
}

class Mixer {
  String customerName;
  String productName;
  String supplierName;

  Mixer({this.customerName, this.productName, this.supplierName});
}
