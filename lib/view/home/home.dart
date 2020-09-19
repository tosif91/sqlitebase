import 'package:flutter/material.dart';
import 'package:sqlitebase/view/home/home_model.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      viewModelBuilder: () => HomeModel(),
      onModelReady: (model) => model.fetchData(),
      builder: (context, model, child) => Scaffold(
          floatingActionButton: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        model.refresh();
                      },
                      child: Icon(
                        Icons.refresh,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        model.addItems(context);
                      },
                      child: Icon(
                        Icons.add,
                      )),
                )
              ],
            ),
          ),
          body: Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: model.data.length,
                itemBuilder: (context, index) => Card(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text(
                                'customer : ${model.data[index].customerName}'),
                            Text(
                                'supplier : ${model.data[index].supplierName}'),
                            Text(
                                'product   : ${model.data[index].productName}'),
                          ],
                        ),
                      ),
                    )),
          )),
    );
  }
}
