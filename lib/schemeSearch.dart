import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/paymentPage.dart';
import 'package:azyan_agent/schemeDetails.dart';
import 'package:azyan_agent/searchSchemeModel.dart';

class SchemeSearch extends StatefulWidget {
  String tocken;
  SchemeSearch(this.tocken);
  @override
  State<SchemeSearch> createState() => _SchemeSearchState();
}

class _SchemeSearchState extends State<SchemeSearch> {
  TextEditingController search = new TextEditingController();
  bool value=false;
  SearchSchemeModel schemData;

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
          'Schemes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
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
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
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
                          child: TextFormField(
                            controller: search,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Scheme No or Phone Number',
                                contentPadding: const EdgeInsets.only(left: 20)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          getData();



                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              value==true&&schemData.data.length>0?Expanded(

                child: ListView.builder(

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
                                            Icon(Icons.person,color: Colors.blue,),
                                            SizedBox(width: 10,),
                                            Text(
                                              'Name',
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
                                        schemData.data[index].firstName,
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
                                                            widget.tocken,schemData.data[index].customerId,
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
                    }),
              ):Padding(
                padding: const EdgeInsets.only(top:20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('No Data Found',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)
                    ],
                  ),


                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
  getData () async {
    Common.showProgressDialog(context, "Loading..");

    schemData = await HttpService.searchScheme(search.text,widget.tocken);

    if(schemData!=null)
    {
      Navigator.pop(context);
      setState(() {
        value=true;

      });
    }

  }
}
