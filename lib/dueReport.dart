import 'package:azyan_agent/dashboard.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:azyan_agent/collectionReportModel.dart';
import 'package:azyan_agent/dueReportModel.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:splashscreen/splashscreen.dart';

class DueReport extends StatefulWidget {
  String tocken;

  DueReport(this.tocken);

  @override
  _DueReportState createState() => _DueReportState();
}

class _DueReportState extends State<DueReport> {
  String _selectedDate;
  String _selectedDate1;
  //DateTime fromdate = DateTime.now();
  //DateTime todate = DateTime.now();


  String todate=DateTime.now().toString();

  TextEditingController toDate = new TextEditingController();
  bool value1 = false;
  DueReportModel schemData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(todate);
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
            'Due Report',
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
                            width: MediaQuery.of(context).size.width * 0.6,
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
                                      todate= value;
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
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: FlatButton(
                              onPressed: () async {
                                getData(todate);
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

                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Total Due Amount",
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
                          Text(schemData!=null?schemData.data.totalDue.toString()+'/-':'0',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: schemData.data.dueReport.length>0?ListView.builder(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: schemData.data.dueReport.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left:8,right: 8),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
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
                                                    schemData.data.dueReport[index].firstName,
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
                                        const EdgeInsets.only(left: 20,),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *
                                                  0.6,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    schemData.data.dueReport[index].schemeName,
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
                                                  schemData.data.dueReport[index].installmentAmount.toString()+'/-',
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
                                            left: 20, bottom: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *
                                                  0.58,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Installment '+schemData.data.dueReport[index].installmentNumber.toString(),
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
                                                  schemData.data.dueReport[index].installmentDate,
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
                            );
                          }):Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No Dues',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)
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

  getData(todate) async {
    schemData = await HttpService.dueReport(
        todate, widget.tocken);


    if (schemData != null) {
      setState(() {
        value1 = true;
      });
    }
  }
}
