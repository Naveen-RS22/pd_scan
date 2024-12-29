import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:pd_scan/screens/scan_screen/scan_screen.dart';
import 'package:pd_scan/utilities/colors.dart';

import '../../utilities/storage.dart';

class ScanScreenViewModel extends ChangeNotifier {
  String scannedData = "No data scanned yet";
  List<String> scannedItems = [];

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String? selectedDepartment; // Variable to store the selected department
  String? selecteditem; // Variable to store the selected department
  String? selecteditemId; // Variable to store the selected department
  String? selectedDepartmentId; // Variable to store the selected department
  List<String> departments = []; // List of departments
  List<String> items = []; // List of departments
  bool isScan = false;
  final carousalCurrentIndex = 0.obs;
  String departmentUrl =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetDepartmentByUser/';
  String barCodeUrl =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetBarCodedetail/';
  String getAllReportItemsUrl =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetItems';
  String getAllReportItemHistory =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetItemHistory/';
  String username = '';
  List<dynamic> departmentsList = [];
  List<dynamic> itemsList = [];
  List<dynamic> itemsHistoryList = [];
  Map<dynamic, dynamic> Qrdata = {};

  onGetInit(String userId, String user) async {
    departments = [];
    selectedDepartmentId = null;
    selectedDepartment = null;
    departmentsList = [];
    Qrdata = {};
    scannedItems = [];
    isScan = false;
    postList = [];
    username = user;
    getDepartment(userId);
    // username = await QStorage().getString('userName');
    // usercode = await QStorage().getString('userCode');
  }

  Future<void> getDepartment(String userId) async {
    final url = '$departmentUrl$userId';

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        departmentsList = data['data'];
        print('departmentsListdepartmentsList');
        print(departmentsList);
        for (int i = 0; i < departmentsList.length; i++) {
          departments.add('${departmentsList[i]['departmentName']}');
        }
        notifyListeners();
        // Handle success
        // Get.snackbar(
        //   'Login Success',
        //   'Welcome ${data['data']['userName']}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 3),
        // );
      } else {
        // Handle server error
        Get.snackbar(
          'Login Error',
          'Failed with status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle connection error
      Get.snackbar(
        'Login Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> getQRDetail(String barCodeId) async {
    final url = '$barCodeUrl$barCodeId';

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        isScan = false;
        Qrdata = data['data'];
        print("Qrdata");
        print(Qrdata);
        notifyListeners();
        // Handle success
        // Get.snackbar(
        //   'Login Success',
        //   'Welcome ${data['data']['userName']}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 3),
        // );
      } else {
        // Handle server error
        Get.snackbar(
          'Login Error',
          'Failed with status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle connection error
      Get.snackbar(
        'Login Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> getitems() async {
    final url = '$getAllReportItemsUrl';
    itemsList=[];
    items=[];
    selecteditemId=null;
    selecteditem=null;
    itemsHistoryList=[];
    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        itemsList = data['data'];
        print('departmentsListdepartmentsList');
        print(itemsList);
        for (int i = 0; i < itemsList.length; i++) {
          items.add('${itemsList[i]['itemName']}');
        }
        notifyListeners();
        // Handle success
        // Get.snackbar(
        //   'Login Success',
        //   'Welcome ${data['data']['userName']}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 3),
        // );
      } else {
        // Handle server error
        Get.snackbar(
          'Login Error',
          'Failed with status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle connection error
      Get.snackbar(
        'Login Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> getitemHistory(String itemID) async {
    final url = '$getAllReportItemHistory$itemID';

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        itemsHistoryList = data['data'];
        print('departmentsListdepartmentsList');
        print(itemsHistoryList);

        notifyListeners();
        // Handle success
        // Get.snackbar(
        //   'Login Success',
        //   'Welcome ${data['data']['userName']}',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 3),
        // );
      } else {
        // Handle server error
        Get.snackbar(
          'Login Error',
          'Failed with status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle connection error
      Get.snackbar(
        'Login Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  setDepartment(String val) {
    departmentsList.map((e) {
      if (e['departmentName'] == val) {
        selectedDepartmentId = e['departmentId'];
      }
    });
    selectedDepartment = val;
    notifyListeners();
  }

  setItems(String val) {
    print("object");
    print(val);
    for(int i=0;i<itemsList.length;i++){
      if (itemsList[i]['itemName'] == val) {
        print("hi");
        selecteditemId =itemsList[i]['itemId'].toString() ;
      }
    }
    itemsList.map((e) {
      print(e['itemName']);
      if (e['itemName'] == val) {
        print("hi");
        selecteditemId = e['itemId'].toString();
      }
    });
    selecteditem = val;
    print('selecteditemIdselecteditemId');
    print(selecteditemId);
    getitemHistory(selecteditemId ?? '');
    notifyListeners();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
    notifyListeners();
  }

  setIsScan() {
    if ((selectedDepartment ?? '').isEmpty || selectedDepartment == null) {
      Get.snackbar(
        'Select Department',
        'Department is mandatory',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: QColors.background2,
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
    } else {
      if (isScan == false) {
        Qrdata = {};
      }
      isScan = !isScan;
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> postList = [];

  addPost() {
    print("Adding post...");

    // Check for duplicates based on 'barCodeDetailId'
    if (!postList.any(
        (element) => element['barCodeDetailId'] == Qrdata['barCodeDetailId'])) {
      postList.add({
        "id": postList.length, // Assign a unique ID based on the list length
        "barCodeDetailId": Qrdata['barCodeDetailId'],
        "barCodeHeadId": Qrdata['barCodeHeadId'],
        "itemId": Qrdata['itemId'],
        "itemName": Qrdata['itemName'],
        "itemCode": Qrdata['itemCode'],
        "itemBarCode": Qrdata['itemBarCode'],
        "departmentID": selectedDepartmentId,
        "createdBy": username,
        "CreatedDate": DateTime.now().toString(), // Convert DateTime to string
      });
      print("Post added successfully.");
    } else {
      Get.snackbar(
        'Item Not added.',
        'Duplicate entry detected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: QColors.background2,
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
      print("Duplicate entry detected. Post not added.");
    }

    print(jsonEncode(postList));

    notifyListeners(); // Notify listeners to update the UI
  }

  setBarCode(String s) {
    scannedData = s;
    getQRDetail(scannedData);
    notifyListeners();
  }

  removeList(int index) {
    postList.removeAt(index);
    notifyListeners();
  }

  clear() {
    Qrdata = {};
    isScan = true;
    notifyListeners();
  }
}
