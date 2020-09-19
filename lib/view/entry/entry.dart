import 'package:flutter/material.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/view/entry/customer_page.dart';
import 'package:sqlitebase/view/entry/entry_model.dart';
import 'package:sqlitebase/view/entry/product_page.dart';
import 'package:sqlitebase/view/entry/supplier_page.dart';
import 'package:stacked/stacked.dart';

class Entry extends StatelessWidget {
  Customer _customer;
PageController _controller=PageController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntryModel>.reactive(
      viewModelBuilder: () => EntryModel(controller: _controller),
      builder: (context, model, _) => Scaffold(body: PageView(
        controller: _controller,
        children: <Widget>[
          CustomerPage(model:model),
          SupplierPage(model:model),
          ProductPage(model:model)
        ],
      )),
    );
  }
}
