import 'dart:convert';
import 'package:azyan_agent/addCustomerModel.dart';
import 'package:azyan_agent/addSchemeModel.dart';
import 'package:azyan_agent/changePasswordModel.dart';
import 'package:azyan_agent/insertSchemeModel.dart';
import 'package:azyan_agent/invoiceModel.dart';
import 'package:azyan_agent/phoneNumberModel.dart';
import 'package:azyan_agent/stateList.dart';
import 'package:dio/dio.dart';
import 'package:azyan_agent/collectionReportModel.dart';
import 'package:azyan_agent/dashboardModel.dart';
import 'package:azyan_agent/dueReportModel.dart';
import 'package:azyan_agent/listCustomerModel.dart';
import 'package:azyan_agent/listCustomers.dart';
import 'package:azyan_agent/mobileNumberExcistModel.dart';

import 'package:azyan_agent/model.dart';
import 'package:azyan_agent/paymentPageModel.dart';
import 'package:azyan_agent/paymentStatusModel.dart';
import 'package:azyan_agent/profileModel.dart';
import 'package:azyan_agent/schemeDetailsModel.dart';
import 'package:azyan_agent/schemeModel.dart';
import 'package:azyan_agent/searchSchemeModel.dart';
import 'package:azyan_agent/transactionHistoyModel.dart';
import 'package:azyan_agent/transactionModel.dart';

class HttpService {
  static Dio _dio = Dio();
  static final baseUrl = "https://login2.in/azyan/index.php/Mobile/";
  //static final baseUrl = "https://login2.co.in/gold_scheme_demo/index.php/Mobile/";

  

  static Future login(uanemVar, pass) async {
    var params = {
      "mobNumber": uanemVar,
      "password": pass,
    };
    try {
      var result = await _dio.get(baseUrl + "login", queryParameters: params);
      print(result);


      RersultModel model = RersultModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future dashboard(token) async {
    var params = {
      "token": token,

    };
    try {
      var result = await _dio.get(baseUrl + "dashboard", queryParameters: params);


      DashboardModel model = DashboardModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future mobileNumberExcist(phoneNumber) async {
    var params = {
      "phoneNumber": phoneNumber,

    };
    try {
      var result = await _dio.get(baseUrl + "check_customer_phoneNumber", queryParameters: params);


      MobileNumberExcistModel model = MobileNumberExcistModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future listCustomers(token,searchKey) async {
    var params = {
      "token": token,
      "searchKey": searchKey,

    };
    try {
      var result = await _dio.get(baseUrl + "customer_view", queryParameters: params);
ListCustomerModel model = ListCustomerModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }


  static Future profile(token) async {
    var params = {
      "token": token,

    };
    try {
      var result = await _dio.get(baseUrl + "profile", queryParameters: params);
      print(result);
    ProfileModel model = ProfileModel.fromJson(result.data);
//print(model);
      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future listSchemes(token,customerMasterId) async {
    var params = {
      "token": token,
      "customerId": customerMasterId,

    };
    try {
      var result = await _dio.get(baseUrl + "view_scheme", queryParameters: params);
      print(params);
      print(result);
ListSchemeModel model = ListSchemeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future invoice(paymentmasterId) async {
    var params = {
      "paymentMasterId": paymentmasterId,
    };
    try {
      var result =
      await _dio.get(baseUrl + "get_invoice", queryParameters: params);
      print(result);

      InvoiceModel model = InvoiceModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future schemeDetails(token,customerSchemeMasterId) async {
    var params = {
      "token":token,
      "customerSchemeMasterId": customerSchemeMasterId,

    };
    try {
      var result = await _dio.get(baseUrl + "view_scheme_details", queryParameters: params);

//       TransationHistory> model = (result.data as List)
//           .map((data) => TransationHistory.fromJson(data))
//           .toList();
// print(model.)
      SchemeDetailsList model = SchemeDetailsList.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future paymentDetails(tocken, customerSchemeMasterId) async {
    var params = {
      "token": tocken,
      "customerSchemeMasterId": customerSchemeMasterId,
    };
    try {
      var result = await _dio.get(baseUrl + "payment", queryParameters: params);

      PaymnetDetails model = PaymnetDetails.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future paymentStatus(body) async {
    print(body);
    var params = {
      "data": body,
    };
    try {
      var result =
      await _dio.post(baseUrl + "addCollection", data: jsonEncode(body));

      PaymentStatusModel model = PaymentStatusModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future searchScheme(search,token) async {
    var params = {
      "searchKey": search,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "view_scheme_search", queryParameters: params);
      print(result);

      SearchSchemeModel model = SearchSchemeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future stateData() async {


    try {
      var result = await _dio.get(baseUrl + "new_customer",);
      print(result);
      StateModel model = StateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future collectionReport(fromDate,toDate,token) async {
    var params = {
      "fromDate": fromDate,
      "toDate": toDate,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "collection_report", queryParameters: params);


      CollectionReportModel model = CollectionReportModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future dueReport(toDate,token) async {
    var params = {
      "toDate": toDate,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "due_report", queryParameters: params);
      print(params);
      print(result);

      DueReportModel model = DueReportModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future checkPhone(phoneNumber) async {
    var params = {
      "phoneNumber": phoneNumber,

    };
    try {
      var result = await _dio.get(baseUrl + "check_customer_phoneNumber", queryParameters: params);
      print(params);
      print(result);

      PhoneNumberModel model = PhoneNumberModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future addSchemeList() async {

    try {
      var result = await _dio.get(baseUrl + "customer_scheme");

      print(result);

      AddSchemeModel model = AddSchemeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future insertScheme(schemeId,startDate,token,customerId) async {
    var params = {
      "customer_id": customerId,
      "scheme_id": schemeId,
      "start_date": startDate,
      "token": token,

    };
    try {
      var result = await _dio.get(baseUrl + "insert_customer_scheme", queryParameters: params);
      print(params);
      print(result);

      InsertSchemeModel model = InsertSchemeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addCustomer(mobileNumber, firstName,lastName,presentAddressLine1,presentAddressLine2,nominee,postOffice,pinCode,
  emailId,nameOfSpouse,addressOfNominee,token) async {
    var params = {
      "mobileNumber": mobileNumber,
      "firstName": firstName,
      "lastName": lastName,
      "presentAddressLine1": presentAddressLine1,
      "presentAddressLine2": presentAddressLine2,
      "nameOfNominee": nominee,
      "presentPostOffice": postOffice,
      "presentPinCode": pinCode,
      "emailId": emailId,
      "nameOfSpouce": nameOfSpouse,
      "addressOfNominee": addressOfNominee,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "add_customer", queryParameters: params);
      print(params);
      print(result);

      AddCustomerModel model = AddCustomerModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future changePassword(tocken, confirmPassword) async {
    var params = {
      "token": tocken,
      "password": confirmPassword,
    };
    try {
      var result =
      await _dio.get(baseUrl + "reset_password", queryParameters: params);

      ChangePasswordModel model = ChangePasswordModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future transcationHistory(userId) async {
    var params = {
      "userId": userId,

    };
    try {
      var result = await _dio.get(baseUrl + "transaction_historty", queryParameters: params);

//       TransationHistory> model = (result.data as List)
//           .map((data) => TransationHistory.fromJson(data))
//           .toList();
// print(model.)
      TransationHistory model = TransationHistory.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
}
