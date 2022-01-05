import 'package:azyan_agent/changePassword.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:flutter/material.dart';
import 'package:azyan_agent/profileModel.dart';
import 'package:splashscreen/splashscreen.dart';

class Profile extends StatefulWidget {
String token;
Profile(this.token);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel profile;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    profile = await HttpService.profile(widget.token);
    if(profile!=null)
    {
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
                        Dashboard(widget.token)),
                    (Route<dynamic> route) => false)
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:profile!=null?Stack(
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
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage:AssetImage('assets/images/user_image.jpg'),
                  radius: 30,
                ),

                Text(profile.data.fistName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text('Personal Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 15,
                  width: 200,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.green,
                            size: 24.0,
                          ),
                          SizedBox(width: 10,),

                          Text(profile.data.mobNumber.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ],
                      ),
                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 24.0,
                          ),
                          SizedBox(width: 10,),
                          Text(profile.data.address,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                        ],
                      ),
                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.green,
                            size: 24.0,
                          ),
                          SizedBox(width: 10,),
                          Text(profile.data.emailId,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ],
                      ),
                    ),



                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.05,
                        width: MediaQuery.of(context)
                            .size
                            .width *
                            0.45,
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
                                      ChangePassword(widget.token)),
                            );
                          },
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )),
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
      ),
    );
  }

}
