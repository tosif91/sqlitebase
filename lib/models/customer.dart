import 'package:flutter/cupertino.dart';
import 'package:sqlitebase/utils/constants.dart';

class Customer {
  int id;
  String name;
  String gst;
  String pan='' ;
  String address='';
  String state='';
  String pinCode='';
  String emailID='';
  String contactNumber='';

  Customer(
      {@required this.id ,
      @required this.name,
      @required this.gst,
       this.pan,
       this.address,
       this.state,
       this.pinCode,
       this.emailID,
       this.contactNumber});

  int get cid => id;
  String get cname => name;
  String get cgst => gst;
  String get cpan => pan;
  String get caddress => address;
  String get cstate => state;
  String get cpincode => pinCode;
  String get cemailid => emailID;
  String get ccontactnumber => contactNumber;

  factory Customer.fromMap(Map<String, dynamic> data) => new Customer(
        id: data[cID],
        name: data[cName],
        // address: data[cAddress],
        // contactNumber: data[cContactNumber],
        // emailID: data[cEmailID],
        gst: data[c_GST_Number],
        // pan: data[c_PAN_Number],
        // pinCode: data[c_Pin_Code],
        // state: data[cState],
      );

  Map<String, dynamic> toMap() => {
        cID: id,
        cName: name,
        // cAddress: address,
        // cContactNumber: contactNumber,
        // cEmailID: emailID,
         c_GST_Number: gst,
        // c_PAN_Number: pan,
        // c_Pin_Code: pinCode,
        // cState: state
      };
}
