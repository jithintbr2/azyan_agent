import 'package:azyan_agent/details.dart';
import 'package:azyan_agent/listSchemes.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/paymentPage.dart';
import 'package:azyan_agent/paymentStatusModel.dart';
import 'package:azyan_agent/schemeDetails.dart';
import 'package:azyan_agent/schemeDetailsModel.dart';
import 'package:azyan_agent/schemeModel.dart';
import 'package:splashscreen/splashscreen.dart';

class PaymentStatus extends StatefulWidget {
  Map<String, dynamic> body;
  String token;
  int customerId;


  PaymentStatus(this.body,this.token,this.customerId);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  PaymentStatusModel schemData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.paymentStatus(widget.body);

    if (schemData != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],

            title: Text(
              'Status',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: schemData != null
              ? Container(
            width: MediaQuery.of(context).size.height * .9,
                  child: schemData.status == true
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/images/success.png'),
                            radius: 50,
                          ),
                          Text('Success',style: TextStyle(fontSize: 30,color:Colors.green,fontWeight: FontWeight.bold),),
                          Text('Payment is SuccessFully Completed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: FlatButton(
                              onPressed: () async {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Details(schemData.data,widget.token,widget.customerId)),
                                        (Route<dynamic> route) => false);

                              },
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:AssetImage('assets/images/failure.png'),
                        radius: 50,
                      ),
                      Text('Failed',style: TextStyle(fontSize: 30,color:Colors.red,fontWeight: FontWeight.bold),),
                      Text('Payment is Failed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FlatButton(
                          onPressed: () async {

                          },
                          child: Text(
                            'Ok',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: SplashScreen(
                    seconds: 6,
                    loadingText: Text("Loading"),
                    photoSize: 100.0,
                    loaderColor: Colors.blue,
                  ),
                )),
    );
  }
}
