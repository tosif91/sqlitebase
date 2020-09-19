import 'package:flutter/cupertino.dart';
import 'package:sqlitebase/utils/constants.dart';

class Product {
  int id;
  String serviceCode='';
  String hSCode='';
  String name;
  String description='';
  String image='';
  String quantity='';
  String minLimit='';
  String cost='';
  String waCost='';
  String salePrice='';
  String gst;
  Product({
     this.waCost,
    @required this.id,
     this.serviceCode,
     this.hSCode,
    @required this.name,
     this.description,
     this.image,
     this.quantity,
     this.minLimit,
     this.cost,
     this.salePrice,
    @required this.gst,
  });

  int get pid => id;
  String get pname => name;
  String get pgst => gst;
  String get pserviceCode => serviceCode;
  String get phsCode => hSCode;
  String get pdescription => description;
  String get pimage => image;
  String get pquantity => quantity;
  String get pminLimit => minLimit;
  String get pcost => cost;
  String get psalePrice => salePrice;
  String get pwaCost => waCost;

  factory Product.fromMap(Map<String, dynamic> data) => new Product(
      id: data[pID],
      name: data[pServiceName],
      gst: data[pGST],
      // serviceCode: data[pCode],
      // hSCode: data[pHSN_SAC_code],
      // description: data[pDescription],
      // image: data[pImage],
      // quantity: data[pQuantity],
      // minLimit: data[pMinLimit],
      // cost: data[pCost],
      // salePrice: data[pSalePrice],
      // waCost: data[pWACost]
      );

  Map<String, dynamic> toMap() => {
        pID: id,
       // pCode: serviceCode,
       // pHSN_SAC_code: hSCode,
        pServiceName: name,
       // pDescription: description,
        //pImage: image,
        //pQuantity: quantity,
        //pMinLimit: minLimit,
       // pCost: cost,
       // pWACost: waCost,
       // pSalePrice: salePrice,
        pGST: gst
      };
}
