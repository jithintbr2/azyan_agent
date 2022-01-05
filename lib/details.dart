import 'dart:io';
import 'dart:typed_data';

import 'package:azyan_agent/collectionReport.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/httpService.dart';

import 'package:azyan_agent/invoiceModel.dart';
import 'package:azyan_agent/listSchemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:splashscreen/splashscreen.dart';


class Details extends StatefulWidget {
  int paymentMasterId;
  String tocken;
  int customerId;

  Details(this.paymentMasterId, this.tocken, this.customerId);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  InvoiceModel schemData;
  var count = 1;
  final _screenshotConroller = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.invoice(widget.paymentMasterId);
    if (schemData != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context)=>
    Screenshot(
      controller: _screenshotConroller,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => CollectionReport(widget.tocken)),
                    (Route<dynamic> route) => false)),
            title: Text(
              'Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: schemData != null
              ?
          Stack(
            children: [
              testWidget(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.yellow[800],
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: FlatButton(
          onPressed: () async {
            final imageFile =
            await _screenshotConroller.captureFromWidget(testWidget());
            saveImage(imageFile);

          },
                          child: Row(
                            children: [
                              Icon(Icons.share),
                              SizedBox(width: 5,),
                              Text(
                              'Share',
                              style: TextStyle(
                                  color: Colors.black,

                                  fontSize: 15),
                        ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.yellow[800],
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: FlatButton(
                            onPressed: () async {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Dashboard(widget.tocken)),
                                      (Route<dynamic> route) => false);

                            },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back),
                              SizedBox(width: 5,),
                              Text(
                                'back',
                                style: TextStyle(
                                    color: Colors.black,

                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
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


  Widget testWidget() => Padding(
        padding: const EdgeInsets.all(7),
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 120.0,
                          height: 40.0,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'assets/images/logo.png')))),
                      SizedBox(
                        height: 10,
                      ),
                      Text(schemData.data.schemeName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text(schemData.data.schemeNo,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                  )),
                ),
                Divider(color: Colors.black),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            child: Column(
                              children: [
                                Text(schemData.data.customerName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text(schemData.data.address,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            child: Column(
                              children: [
                                Text(schemData.data.invoiceNumber,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(schemData.data.datePaid,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.black),
                Container(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sl No',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        Text('Installment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        Text('Amount',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: schemData.data.installmentDetails.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        count = count;
                      } else {
                        count = count + 1;
                      }
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$count',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                  'Installment ' +
                                      schemData.data.installmentDetails[index]
                                          .installmentNumber
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                  schemData.data.installmentDetails[index]
                                          .installmentAmount
                                          .toString() +
                                      '/-',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      );
                    }),
                Divider(color: Colors.black),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(''),
                        Text(schemData.data.amount.toString() + '/-',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.black),

              ],
            ),
          ),
        ),
      );



  Future<String> saveImage(Uint8List bytes) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    File image = File('${documentDirectory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }
}
