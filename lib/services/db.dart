import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlitebase/models/customer.dart';
import 'package:sqlitebase/models/product.dart';
import 'package:sqlitebase/models/supplier.dart';
import 'package:sqlitebase/utils/constants.dart';

class DB {
  Database _db;
  Database get myDB => _db;
  int get version => 1;
  Batch _batch;
  
 


  Future<void> init() async {
     String _path = await getDatabasesPath() + 'businesstracker.db';
     print('my $_path');
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'businesstracker.db';
     
      _db = await openDatabase(_path, version: version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $cTableName ($cID INTERGER PRIMARY KEY NOT NULL,  $cName TEXT,  $c_GST_Number TEXT, $c_PAN_Number TEXT, $cAddress TEXT, $cState TEXT, $c_Pin_Code TEXT, $cEmailID TEXT, $cContactNumber TEXT )');

    await db.execute(
        'CREATE TABLE $sTableName ($sID INTERGER PRIMARY KEY NOT NULL,$sName TEXT,$s_GST_Number TEXT,$s_PAN_Number TEXT,$sAddress TEXT,$sState TEXT,$s_Pin_Code TEXT,$sEmailID TEXT,$sContactNumber TEXT)');

    await db.execute(
        'CREATE TABLE $pTableName ($pID INTERGER PRIMARY KEY NOT NULL,$pCode TEXT,$pHSN_SAC_code TEXT,$pServiceName TEXT,$pDescription TEXT,$pImage TEXT,$pQuantity TEXT,$pMinLimit TEXT,$pCost TEXT,$pWACost TEXT,$pSalePrice TEXT,$pGST TEXT)');
  }

  

  Future<bool> createBatchOperation(Customer cObj,Supplier sObj,Product pObj) async {
    print('${cObj.cid} sadfskhfsdakl;fjsdfh;kjlsdfds');
   _batch=_db.batch();
_batch.insert(cTableName, cObj.toMap());
_batch.insert(sTableName, sObj.toMap());
_batch.insert(pTableName, pObj.toMap());

var result=await _batch.commit();
return (result != null)?true:false;

  }

  
  Future<List> getCustomers() async {
    var result = await _db.query(cTableName, columns: [
      cID,
      cName,
      c_GST_Number,
      c_PAN_Number,
      cAddress,
      cState,
      c_Pin_Code,
      cEmailID,
      cContactNumber
    ]);
    return result.toList();
  }
  Future<List> getSuppliers() async {
    var result = await _db.query(sTableName, columns: [
      sID,
      sName,
      s_GST_Number,
      s_PAN_Number,
      sAddress,
      sState,
      s_Pin_Code,
      sEmailID,
      sContactNumber
    ]);
    return result.toList();
  }

  Future<List> getProducts() async {
    var result = await _db.query(pTableName, columns: [
      pID,
      pCode,
      pHSN_SAC_code,
      pServiceName,
      pDescription,
      pImage,
      pQuantity,
      pMinLimit,
      pCost,
      pWACost,
      pSalePrice,
      pGST
    ]);
    return result.toList();
  }

/// logic from drives
getPath(){

}

// db  to csv converter
  Future<void> generateCustomerCSV() async {
    //int i=0;
    List<Customer> data = await list().first;
    List<List<String>> csvData = [
      // headers
      <String>[cID,cName , c_GST_Number],
      // data
      ...data.map((item) => [item.id.toString(),item.name, item.gst, ]),// need to access data. 
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/customers.csv';
        print('my csv pat $path');
    // create file
    final File file = File(path);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);

  
  }
    Future<List<Map>> findAll({@required String tableName}) async {
    return await _db.query(tableName);
  }

   Stream<List<Customer>> list() => Stream.fromFuture(
          findAll(tableName: 'Customer'))
      .map(
        (List<Map> list) => list.map((m) => Customer.fromMap(m)).toList(),
      )
      .take(1);

}
