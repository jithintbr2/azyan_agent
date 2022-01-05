import 'package:azyan_agent/addScheme.dart';
import 'package:azyan_agent/listCustomers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/paymentPage.dart';
import 'package:azyan_agent/schemeDetails.dart';
import 'package:azyan_agent/schemeDetailsModel.dart';
import 'package:azyan_agent/schemeModel.dart';
import 'package:splashscreen/splashscreen.dart';

class ListSchemes extends StatefulWidget {
  String tocken;
  int customerId;

  ListSchemes(this.tocken,this.customerId);

  @override
  State<ListSchemes> createState() => _ListSchemesState();
}

class _ListSchemesState extends State<ListSchemes> {
  ListSchemeModel schemData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    schemData = await HttpService.listSchemes(widget.tocken,widget.customerId);

    if(schemData!=null)
    {
      setState(() {

      });
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
              onPressed: () =>Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        listCustomers(widget.tocken
                        )),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Schemes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_box_outlined, color: Colors.black),
                  onPressed: () =>Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddScheme(widget.customerId,widget.tocken
                               )),
                  ),
                ),

              ],
            ),

          ),
          body:
          schemData!=null?
          Stack(
            children:[
              schemData.data.length>0?Container(
                height: MediaQuery.of(context).size.height * 10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_img.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height * 10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/no_data.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView.builder(

                  shrinkWrap: true,
                  itemCount: schemData.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:30,right:30,top: 10),
                      child: Card(
                        elevation: 10,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(schemData.data[index].schemeName
                                ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 200,
                              child: Divider(
                                color: Colors.black,
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
                                          Icon(Icons.list_alt,color: Colors.blue,),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Scheme Id',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      schemData.data[index].schemeNo,
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
                                padding:
                                const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 130,
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today_outlined,color: Colors.blue,),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Start Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      schemData.data[index].beginDate,
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
                                padding:
                                const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 130,
                                      child: Row(
                                        children: [
                                          Icon(Icons.money,color: Colors.blue,),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      schemData.data[index].schemeAmount.toString()+'/-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20, top: 10,bottom: 20),
                                child: Row(
                                  children: [
                                    Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.05,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentPage(
                                                          widget.tocken,widget.customerId,
                                                          schemData
                                                              .data[index]
                                                              .customerSchemeMasterId)),
                                            );

                                          },
                                          child: Text(
                                            'Pay',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.05,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        child: FlatButton(
                                          onPressed: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShcemeDetails(widget.tocken,schemData
                                                          .data[index]
                                                          .customerSchemeMasterId)),
                                            );
                                          },
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),

                                  ],
                                ),

                              ),

                            ),
                          ],
                        ),
                      ),
                    );
                  }),],
          ):Container(
            child: SplashScreen(
              seconds: 6,
              loadingText: Text("Loading"),
              photoSize: 100.0,
              loaderColor: Colors.blue,
            ),
          )
      ),
    );
  }
}
