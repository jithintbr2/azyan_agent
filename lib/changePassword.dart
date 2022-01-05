import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:azyan_agent/changePasswordModel.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/model.dart';
import 'package:azyan_agent/httpService.dart';
import 'package:azyan_agent/profile.dart';
import 'package:azyan_agent/transactionModel.dart';

class ChangePassword extends StatefulWidget {
  String tocken;

  ChangePassword(this.tocken);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPassword = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Change Pasword',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: newPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_open_rounded),
                        hintText: 'New Password',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: confirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outlined),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FlatButton(
                  onPressed: () async {
                    if (newPassword.text.isEmpty) {
                      Common.toastMessaage(
                          'New Password cannot be empty', Colors.red);
                    } else if (confirmPassword.text.isEmpty) {
                      Common.toastMessaage(
                          'Confirm Password cannot be empty', Colors.red);
                    } else if (newPassword.text != confirmPassword.text) {
                      Common.toastMessaage(
                          'Confirm Password cannot Match', Colors.red);
                    } else {
                      ChangePasswordModel object =
                      await HttpService.changePassword(
                          widget.tocken, confirmPassword.text);

                      if (object.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(widget.tocken)),
                        );
                        Common.toastMessaage(
                            'Password Change Successfully', Colors.green);
                      } else {
                        Common.toastMessaage(
                            'Password Not Cahnged', Colors.red);
                      }
                    }
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
