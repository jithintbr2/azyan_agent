import 'package:flutter/material.dart';
import 'package:azyan_agent/addCustomers.dart';
import 'package:azyan_agent/collectionReport.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboardModel.dart';
import 'package:azyan_agent/dueReport.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/listCustomers.dart';
import 'package:azyan_agent/model.dart';
import 'package:azyan_agent/new_login.dart';
import 'package:azyan_agent/profile.dart';
import 'package:azyan_agent/profileModel.dart';
import 'package:azyan_agent/schemeSearch.dart';
import 'package:splashscreen/splashscreen.dart';


class Dashboard extends StatefulWidget {
  String tocken;
  Dashboard(this.tocken);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardModel schemData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.dashboard(widget.tocken);
    if (schemData != null) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        schemData!=null?Stack(
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
            SafeArea(

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user_image.jpg'),
                              radius: 40,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(schemData.data.agentName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.05,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius:
                                      BorderRadius.circular(16),
                                    ),
                                    child: FlatButton(
                                      onPressed:()=>_dialogue(context),
                                      child: Text(
                                        'Log Out',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    )),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:50),
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 15),
                         child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.16,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Card(
                                  elevation: 10,
                                  shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                addCustomer(widget.tocken)),
                                      );


                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [

                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/icon_add_customer.jpg'),
                                            radius: 30,
                                          ),
                                          SizedBox(height: 5,),

                                          Text('Customers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),


                                        ],
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(width: 5,),

                              Container(
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.16,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Card(
                                  elevation: 10,
                                  shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SchemeSearch(widget.tocken)),
                                      );


                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/icon_add_collection.png'),
                                            radius: 30,
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Collection',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),


                                        ],
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(width: 5,),

                            ],
                          ),
                       ),
                       SizedBox(height: 10,),
                       Container(
                         height: MediaQuery.of(context)
                             .size
                             .height *
                             0.11,
                         width: MediaQuery.of(context).size.width * 0.9,
                         child: Card(
                           elevation: 10,
                           shape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child: InkWell(
                             onTap: () async {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>
                                         listCustomers(widget.tocken)),
                               );


                             },


                             child: Padding(
                               padding: const EdgeInsets.only(top: 10),
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:20),
                                     child: CircleAvatar(
                                       backgroundImage: AssetImage(
                                           'assets/images/icon_customer_list.png'),
                                       radius: 25,
                                     ),
                                   ),


                                   Padding(
                                     padding: const EdgeInsets.only(left:20,right: 20),
                                     child: Text('Existing Customers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                   ),

                                   Container(
                                     height: 50,
                                       width: 50,
                                       decoration: BoxDecoration(
                                         color: Colors.blue,
                                           border: Border.all(
                                             color: Colors.black,
                                           ),
                                           borderRadius: BorderRadius.all(Radius.circular(25))
                                       ),
                                       child:Center(child: Text(schemData.data.existingCustomers.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                                   )


                                 ],
                               ),
                             ),
                           ),

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,top: 10),
                         child: Row(
                           children: [
                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Column(
                                     children: [

                                       Container(
                                           height: 60,
                                           width: 60,
                                           decoration: BoxDecoration(
                                               color: Colors.blue,
                                               border: Border.all(
                                                 color: Colors.black,
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(30))
                                           ),
                                           child:Center(child: Text(schemData.data.activeSchemes.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                                       ),
                                       SizedBox(height: 5,),

                                       Column(
                                         children: [
                                           Text('Active',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                           Text('Schemes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                         ],
                                       ),


                                     ],
                                   ),
                                 ),

                               ),
                             ),
                             SizedBox(width: 5,),

                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: InkWell(
                                   onTap: () async {



                                   },

                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 10),
                                     child: Column(
                                       children: [
                                         Container(
                                             height: 60,
                                             width: 60,
                                             decoration: BoxDecoration(
                                                 color: Colors.blue,
                                                 border: Border.all(
                                                   color: Colors.black,
                                                 ),
                                                 borderRadius: BorderRadius.all(Radius.circular(30))
                                             ),
                                             child:Center(child: Text(schemData.data.newBusiness.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                                         ),
                                         SizedBox(height: 5,),
                                         Column(
                                           children: [
                                             Text('New',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                             Text('(This Month)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                           ],
                                         ),


                                       ],
                                     ),
                                   ),
                                 ),

                               ),
                             ),
                             SizedBox(width: 5,),
                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left: 10,top:30,bottom:10),
                                         child: Row(
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

                                             Text(schemData.data.todaysCollection.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 5,),
                                       Column(
                                         children: [
                                           Text('Todays',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                           Text('Collection',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                         ],
                                       ),


                                     ],
                                   ),
                                 ),

                               ),
                             ),

                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5,top: 10),
                         child: Row(
                           children: [
                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: InkWell(
                                   onTap: () async {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               CollectionReport(widget.tocken)),
                                     );


                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 10),
                                     child: Column(
                                       children: [

                                         CircleAvatar(
                                           backgroundImage: AssetImage(
                                               'assets/images/icon_collection_report.jpg'),
                                           radius: 30,
                                         ),
                                         SizedBox(height: 5,),

                                         Column(
                                           children: [
                                             Text('Collection ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                             Text('Report ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                           ],
                                         ),


                                       ],
                                     ),
                                   ),
                                 ),

                               ),
                             ),
                             SizedBox(width: 5,),

                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: InkWell(
                                   onTap: () async {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               DueReport(widget.tocken)),
                                     );


                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 10),
                                     child: Column(
                                       children: [
                                         CircleAvatar(
                                           backgroundImage: AssetImage(
                                               'assets/images/icon_due_report.png'),
                                           radius: 30,
                                         ),
                                         SizedBox(height: 5,),
                                         Column(
                                           children: [
                                             Text('Due ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                             Text('Report ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                           ],
                                         ),


                                       ],
                                     ),
                                   ),
                                 ),

                               ),
                             ),
                             SizedBox(width: 5,),
                             Container(
                               height: MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.18,
                               width: MediaQuery.of(context).size.width * 0.3,
                               child: Card(
                                 elevation: 10,
                                 shape:RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: InkWell(
                                   onTap: () async {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               Profile(widget.tocken)),
                                     );


                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 10),
                                     child: Column(
                                       children: [
                                         CircleAvatar(
                                           backgroundImage: AssetImage(
                                               'assets/images/icon_profile.png'),
                                           radius: 30,
                                         ),
                                         SizedBox(height: 15,),
                                         Text('Profile',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),


                                       ],
                                     ),
                                   ),
                                 ),

                               ),
                             ),

                           ],
                         ),
                       ),

                     ],
                   ),
                 ),


                ],
              ),
            ),
          ],
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
  void _dialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Logout?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Common.saveSharedPref("Logout","success");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                NewLogin()),
                            (Route<dynamic> route) => false);

                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }
}
