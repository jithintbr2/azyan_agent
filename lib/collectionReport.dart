import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/details.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:azyan_agent/collectionReportModel.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:splashscreen/splashscreen.dart';

class CollectionReport extends StatefulWidget {
  String tocken;

  CollectionReport(this.tocken);

  @override
  _CollectionReportState createState() => _CollectionReportState();
}

class _CollectionReportState extends State<CollectionReport> {
  String _selectedDate;
  String _selectedDate1;
  //DateTime fromdate = DateTime.now();
  //DateTime todate = DateTime.now();

  String fromdate=DateTime.now().toString();
  String todate=DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool value1 = false;
  CollectionReportModel schemData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(fromdate,todate);
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
          'Collection Report',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: schemData!=null?Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_img.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: DateTimePicker(
                              initialValue: fromdate,

                              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                              type: DateTimePickerType.date,
                             dateHintText: 'From Date',
                              //controller: fromDate,
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              // This will add one year from current date
                              validator: (value) {
                                return null;
                              },
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    fromdate= value;
                                  });
                                }
                              },
                              // We can also use onSaved
                              onSaved: (value) {
                                if (value.isNotEmpty) {
                                  fromdate = value;
                                }

                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: DateTimePicker(
                              initialValue: todate,
                              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                              type: DateTimePickerType.date,
                              dateHintText: 'To date',

                              //controller: toDate,
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              // This will add one year from current date
                              validator: (value) {
                                return null;
                              },
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    todate = value;
                                  });
                                }
                              },
                              // We can also use onSaved
                              onSaved: (value) {
                                if (value.isNotEmpty) {
                                  todate = value;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        getData(fromdate,todate);
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text("Total Collection Amount",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/icon_inr.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(schemData!=null?schemData.data.totalCollection.toString()+'/-':'0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: schemData.data.collectionReport.length>0?ListView.builder(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: schemData.data.collectionReport.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left:8,right: 8),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: InkWell(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Details(schemData.data.collectionReport[index].paymentCollectionMasterId,widget.tocken,schemData.data.collectionReport[index].customerId)),
                                  );


                                },
                                child: Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 20, top: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *
                                                  0.6,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    schemData.data.collectionReport[index].firstName,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *
                                                  0.6,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    schemData.data.collectionReport[index].schemeName,
                                                    style: TextStyle(

                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/icon_inr.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Text(
                                                  schemData.data.collectionReport[index].amount.toString()+'/-',
                                                  //schemData.data.collectionReport[index].amount+'/-',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,bottom: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *
                                                  0.58,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Receipt Id: '+schemData.data.collectionReport[index].invoiceNumber,
                                                    style: TextStyle(

                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  schemData.data.collectionReport[index].datePaid,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }):Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No Collection',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)
                        ],
                      ),



                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ):
      Container(
        child: SplashScreen(
          seconds: 6,
          loadingText: Text("Loading"),
          photoSize: 100.0,
          loaderColor: Colors.blue,
        ),
      )
    );
  }

  getData(fromdate,todate) async {
    schemData = await HttpService.collectionReport(
        fromdate,todate, widget.tocken);


    if (schemData != null) {
      setState(() {
        value1 = true;
      });
    }
  }
}
