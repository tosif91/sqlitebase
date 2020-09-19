import 'package:flutter/cupertino.dart';
import 'package:sqlitebase/utils/constants.dart';

class Supplier {
  int id;
  String name;
  String gst;
  String pan='';
  String address='';
  String state='';
  String pinCode='';
  String emailID='';
  String contactNumber='';

  Supplier(
      {@required this.id,
      @required this.name,
      @required this.gst,
       this.pan,
       this.address,
       this.state,
       this.pinCode,
       this.emailID,
       this.contactNumber});

  int get sid => id;
  String get sname => name;
  String get sgst => gst;
  String get span => pan;
  String get saddress => address;
  String get sstate => state;
  String get spincode => pinCode;
  String get semailid => emailID;
  String get scontactnumber => contactNumber;

  factory Supplier.fromMap(Map<String, dynamic> data) => new Supplier(
        id: data[sID],
        name: data[sName],
        // address: data[sAddress],
        // contactNumber: data[sContactNumber],
        // emailID: data[sEmailID],
        gst: data[s_GST_Number],
        // pan: data[s_PAN_Number],
        // pinCode: data[s_Pin_Code],
        // state: data[sState],
      );

  Map<String, dynamic> toMap() => {
        sID: id,
        sName: name,
        // sAddress: address,
        // sContactNumber: contactNumber,
        // sEmailID: emailID,
        s_GST_Number: gst,
        // s_PAN_Number: pan,
        // s_Pin_Code: pinCode,
        // sState: state
      };
}
