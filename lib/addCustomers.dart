import 'package:azyan_agent/addCustomerModel.dart';
import 'package:azyan_agent/addScheme.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/listCustomers.dart';
import 'package:azyan_agent/phoneNumberModel.dart';
import 'package:azyan_agent/stateList.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class addCustomer extends StatefulWidget {
  String tocken;

  addCustomer(this.tocken);

  @override
  _addCustomerState createState() => _addCustomerState();
}

class _addCustomerState extends State<addCustomer> {
  TextEditingController mobileNumber = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController presentAddressLine1 = new TextEditingController();
  TextEditingController presentAddressLine2 = new TextEditingController();
  TextEditingController nominee = new TextEditingController();
  TextEditingController postOffice = new TextEditingController();
  TextEditingController district = new TextEditingController();
  TextEditingController nominee_relation = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController pinCode = new TextEditingController();
  TextEditingController emailId = new TextEditingController();
  TextEditingController nameOfSpouse = new TextEditingController();
  TextEditingController addressOfNominee = new TextEditingController();
  List<dropBoxClass> listItems;
  StateModel stateListData;

  void initState() {
    // TODO: implement initState
    super.initState();
    stateData();
    listItems = new List();
  }

  stateData() async {
    stateListData = await HttpService.stateData();
    if (stateListData != null) {
      stateListData.data.states.forEach((element) {
        listItems.add(dropBoxClass(
            element.stateId, element.stateName, element.districts));
      });
      setState(() {});
    }
    print(listItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      Dashboard(widget.tocken)),
                  (Route<dynamic> route) => false)
        ),
        title: Text(
          'Add Customer',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  textFeildFunction('Mobile Number', mobileNumber,TextInputType.number),
                  textFeildFunction('First Name', firstName,TextInputType.text),
                  textFeildFunction('Last Name', lastName,TextInputType.text),
                  textFeildFunction(
                      'Present Address Line1', presentAddressLine1,TextInputType.text),
                  textFeildFunction(
                      'Present Address Line2', presentAddressLine2,TextInputType.text),
                  textFeildFunction('Name Of Nominee', nominee,TextInputType.text),
                  textFeildFunction('Present Post Office', postOffice,TextInputType.text),
                  textFeildFunction('Present Pincode', pinCode,TextInputType.number),
                  textFeildFunction('Email Id', emailId,TextInputType.text),
                  textFeildFunction('Name Of Spouse', nameOfSpouse,TextInputType.text),
                  textFeildFunction('Nominee Address', addressOfNominee,TextInputType.text),
                ],
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 7,
                color: Colors.white,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () async {
                    if (mobileNumber.text.isEmpty) {
                      Common.toastMessaage(
                          'Mobile Number cannot be empty', Colors.red);
                    } else if (firstName.text.isEmpty) {
                      Common.toastMessaage(
                          'First Name cannot be empty', Colors.red);
                    } else {
                      PhoneNumberModel phopne=await HttpService.checkPhone(
                          mobileNumber.text,
                         );
                      if(phopne.status==true) {
                        Common.toastMessaage(
                            'Mobile Number Already Exist', Colors.red);

                      }
                      else
                        {
                          AddCustomerModel object = await HttpService.addCustomer(
                              mobileNumber.text,
                              firstName.text,
                              lastName.text,
                              presentAddressLine1.text,
                              presentAddressLine2.text,
                              nominee.text,
                              postOffice.text,
                              pinCode.text,
                              emailId.text,
                              nameOfSpouse.text,
                              addressOfNominee.text,
                              widget.tocken);

                          if (object.status == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddScheme(object.data,widget.tocken),
                              ),
                            );

                            Common.toastMessaage(
                                'Added successfully', Colors.green);
                          } else {
                            Common.toastMessaage(
                                'Failed', Colors.red);
                          }
                        }
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  textFeildFunction(hintname, controller,keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType:keyboardType,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintname,

                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
          ),
        ),
      ),
    );
  }
}

class dropBoxClass {
  dropBoxClass(this.stateId, this.stateName, this.districs);

  int stateId;
  String stateName;
  List districs;

  getstateId() {
    return stateId;
  }

  getStateName() {
    return stateName;
  }

  getDistrics() {
    return districs;
  }
}
