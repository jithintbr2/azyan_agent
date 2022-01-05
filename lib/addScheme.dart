
import 'package:azyan_agent/addSchemeModel.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/insertSchemeModel.dart';
import 'package:azyan_agent/listCustomers.dart';
import 'package:azyan_agent/listSchemes.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class AddScheme extends StatefulWidget {

  int customerId;
  String token;
  AddScheme(this.customerId,this.token);
  @override
  _AddSchemeState createState() => _AddSchemeState();
}

class _AddSchemeState extends State<AddScheme> {

  var currentSelectedValue;

  String startDate=DateTime.now().toString();
  AddSchemeModel schemData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    schemData = await HttpService.addSchemeList();

    if(schemData!=null)
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
            onPressed: () =>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      listCustomers(widget.token
                      )),
            ),
          ),
          title: Text(
            'Add Scheme',
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
            width: MediaQuery.of(context).size.width * 9,
            child: Column(

              children: [
                Card(
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: FormField<String>(

                          builder: (FormFieldState<String> state) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Select Scheme"),
                                  value: currentSelectedValue,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue = newValue;
                                    });
                                    print(currentSelectedValue);
                                  },
                                  items: schemData.data.map((data) {
                                    return DropdownMenuItem(
                                      value: data.masterSchemeId.toString(),
                                      child: Text(data.schemeName),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: DateTimePicker(
                              initialValue: startDate,

                              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                              type: DateTimePickerType.date,
                              dateHintText: 'Start date',
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
                                    startDate= value;
                                  });
                                }
                              },
                              // We can also use onSaved
                              onSaved: (value) {
                                if (value.isNotEmpty) {
                                  startDate = value;
                                }

                              },
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
          Align(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 7,
                color: Colors.white,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () async {
                    if (currentSelectedValue==null) {
                      Common.toastMessaage(
                          'Chose Atleast One Scheme', Colors.red);
                    } else if (startDate.isEmpty) {
                      Common.toastMessaage(
                          'Select Date', Colors.red);
                    }
                    else
                    {
                      InsertSchemeModel object = await HttpService.insertScheme(currentSelectedValue,startDate,widget.token,widget.customerId);

                      if (object.data == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListSchemes(widget.token,widget.customerId),
                          ),
                        );

                        Common.toastMessaage(
                            'Added successfully', Colors.green);
                      } else {
                        Common.toastMessaage(
                            'Failed', Colors.red);
                      }
                    }

                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
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
            );

  }






}

