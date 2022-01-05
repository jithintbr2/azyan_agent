import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/schemeDetailsModel.dart';
import 'package:splashscreen/splashscreen.dart';

class ShcemeDetails extends StatefulWidget {
  String tocken;
  int customerMasterId;
  ShcemeDetails(this.tocken,this.customerMasterId);

  @override
  _ShcemeDetailsState createState() => _ShcemeDetailsState();
}

class _ShcemeDetailsState extends State<ShcemeDetails> {
  SchemeDetailsList schemData;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.schemeDetails(widget.tocken,widget.customerMasterId);
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Scheme Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: schemData != null
              ? Stack(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.list_alt,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Scheme Id',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    schemData.data.schemeNo,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,

                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Start Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    schemData.data.beginDate,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.money,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    schemData.data.schemeAmount.toString()+'/-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: schemData.data.installmentDetails.length,
                          itemBuilder: (context, index) {



                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(


                                color: schemData
                                    .data
                                    .installmentDetails[
                                index]
                                    .hasPaid ==
                                    'Y'
                                    ? Colors.grey[400]:Colors.white,

                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: Text(
                                          'Installment ' +
                                              schemData
                                                  .data
                                                  .installmentDetails[index]
                                                  .installmentNumber
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 130,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    schemData
                                                        .data
                                                        .installmentDetails[
                                                    index]
                                                        .hasPaid ==
                                                        'Y'
                                                        ? 'Paid Date'
                                                        : 'Due Date',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              schemData
                                                  .data
                                                  .installmentDetails[
                                              index]
                                                  .hasPaid ==
                                                  'Y'
                                                  ? schemData
                                                  .data
                                                  .installmentDetails[index]
                                                  .datePaid
                                                  : schemData
                                                  .data
                                                  .installmentDetails[index]
                                                  .installmentDate,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10,bottom: 10 ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 130,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.money,
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Amount',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              schemData.data.installmentDetails[index].installmentAmount
                                                  .toString()+'/-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
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
  }
}
