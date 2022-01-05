
import 'package:azyan_agent/addCustomers.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/listCustomerModel.dart';
import 'package:azyan_agent/listSchemes.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class listCustomers extends StatefulWidget {
  String tocken;


  listCustomers(this.tocken);
  @override
  _listCustomersState createState() => _listCustomersState();
}

class _listCustomersState extends State<listCustomers> {
  TextEditingController search = new TextEditingController();
  String searchKey;
  bool isLoading = true;

  ListCustomerModel schemData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.tocken,searchKey);
  }

  getData(token,searchData) async {

    setState(() {
      isLoading = true;
    });
    schemData = await HttpService.listCustomers(token,searchData);





    if (schemData != null) {
      if(searchData!=null) {
        Navigator.pop(context);
      }

      setState(() {

      });
    }
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer List',
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
                        addCustomer(widget.tocken
                        )),
              ),
            ),
          ],
        ),
      ),
      body:schemData!=null?Stack(
        children: [
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
          Align(
            child: top(),
            alignment: Alignment.topCenter,
          ),
         Padding(
            padding: const EdgeInsets.only(top: 60),
            child: GridView.builder(
               itemCount: schemData.data.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 childAspectRatio: 8.0 / 10.0,
                 crossAxisCount: 2,
               ),

               itemBuilder: (BuildContext context, int index) {
                return _listItems(index);
               },
             )
          )

        ],

      ):Container(
      child: SplashScreen(
      seconds: 6,
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    ),
    ));


  }
  _searchBar()
  {
    return Padding(padding: const EdgeInsets.all(8.0),child: TextField(decoration: InputDecoration(hintText: 'Search'),),);

  }
  _listItems(index)
  {
    return Padding(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Card(
              elevation: 10,
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ListSchemes(widget.tocken,schemData.data[index].customerId),),
                  );


                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/user_image.jpg'),
                        radius: 25,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          schemData.data[index].firstName,
                          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top:5),
                        child: Text(
                          schemData.data[index].mobileNumber.toString(),
                          style: TextStyle(fontSize: 15),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top:5),
                        child: Text('DOB : '+
                            schemData.data[index].dateOfBirth,
                          style: TextStyle(fontSize: 15),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top:22),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () async{

                                String url = 'tel:'+schemData.data[index].mobileNumber.toString();
                                if (await canLaunch(url)) {
                                await launch(url);
                                } else {
                                throw 'Could not launch $url';
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.call_sharp,color: Colors.black,size: 15,),
                                  SizedBox(width: 8,),
                                  Text('Call Customer'),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),),
                  ],
                ),
              )),
        ));
  }

  top() {
    return Row(
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
                      hintText: 'Search Phone Number',
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
                Common.showProgressDialog(context, "Loading..");
            getData(widget.tocken,search.text);



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
    );
  }

}
