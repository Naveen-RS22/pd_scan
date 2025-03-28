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
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetBarCodedetailwithValid/';
  String getAllReportItemsUrl =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetItems';
  String getAllReportItemHistory =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/GetItemHistory/';
  String postUrl =
      'https://app.flowforceengineering.com/api/BarCodeHeadApi/CreateBarCodeScanDetails';
  String username = '';
  String userID = '';
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
    userID = userId;
    print('userID');
    print(userID);
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
    final url = '$barCodeUrl$selectedDepartmentId/$barCodeId';

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null) {
          if (data['msg'] == 'Success') {
            isScan = false;
            Qrdata = data['data'];
            print("Qrdata");
            print(Qrdata); print("postList");
            print(postList);
            bool isDuplicate = postList.any(
                  (element) => element['itemBarCode'] == Qrdata['itemBarCode'],
            );

            if (isDuplicate) {
              Get.snackbar(
                'Failed',
                'Duplicate entry detected',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: QColors.background2,
                colorText: Colors.black,
                duration: const Duration(seconds: 3),
              );
              Qrdata = {};
              isScan = false;
              print("Item already exists in the post list.");
            } else {
              print("e post list.");

            }

          } else if (data['msg'] == 'Already Scanned') {
            Qrdata = {};
            isScan = false;
            Get.snackbar(
              'Already Scanned',
              '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: QColors.background2,
              colorText: Colors.black,
              duration: const Duration(seconds: 3),
            );
          } else if (data['msg'] == 'InValid') {
            Qrdata = {};
            isScan = false;
            Get.snackbar(
              'Invalid',
              '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: QColors.background2,
              colorText: Colors.black,
              duration: const Duration(seconds: 3),
            );
          }
        } else {
          Get.snackbar(
            'Invalid BarCode',
            '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
          );
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
      // Get.snackbar(
      //   'Login Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      //   duration: const Duration(seconds: 3),
      // );
    }
  }

  Future<void> getitems() async {
    final url = '$getAllReportItemsUrl';
    itemsList = [];
    items = [];
    selecteditemId = null;
    selecteditem = null;
    itemsHistoryList = [];
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

  // Future<void> postApi() async {
  //   final url = '$postUrl';
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(postList)
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //
  //       notifyListeners();
  //       // Handle success
  //       // Get.snackbar(
  //       //   'Login Success',
  //       //   'Welcome ${data['data']['userName']}',
  //       //   snackPosition: SnackPosition.BOTTOM,
  //       //   backgroundColor: Colors.green,
  //       //   colorText: Colors.white,
  //       //   duration: const Duration(seconds: 3),
  //       // );
  //     } else {
  //       // Handle server error
  //       Get.snackbar(
  //         'Login Error',
  //         'Failed with status: ${response.statusCode}',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //         duration: const Duration(seconds: 3),
  //       );
  //     }
  //   } catch (e) {
  //     // Handle connection error
  //     Get.snackbar(
  //       'Login Error',
  //       'Something went wrong: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 3),
  //     );
  //   }
  // }

  setDepartment(String val) {
    for (int i = 0; i < departmentsList.length; i++) {
      if (departmentsList[i]['departmentName'] == val) {
        print("hi");
        selectedDepartmentId = departmentsList[i]['departmentId'].toString();
      }
    }
    // departmentsList.map((e) {
    //   if (e['departmentName'] == val) {
    //     selectedDepartmentId = e['departmentId'];
    //   }
    // });
    print(selectedDepartmentId);
    selectedDepartment = val;
    notifyListeners();
  }

  setItems(String val) {
    print("object");
    print(val);
    for (int i = 0; i < itemsList.length; i++) {
      if (itemsList[i]['itemName'] == val) {
        print("hi");
        selecteditemId = itemsList[i]['itemId'].toString();
      }
    }
    // itemsList.map((e) {
    //   print(e['itemName']);
    //   if (e['itemName'] == val) {
    //     print("hi");
    //     selecteditemId = e['itemId'].toString();
    //   }
    // });
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
        "id": 0,
        // Assign a unique ID based on the list length
        "barCodeDetailId": Qrdata['barCodeDetailId'],
        "barCodeHeadId": Qrdata['barCodeHeadId'],
        "itemId": Qrdata['itemId'],
        "itemName": Qrdata['itemName'],
        "itemCode": Qrdata['itemCode'],
        "itemBarCode": Qrdata['itemBarCode'],
        "departmentID": selectedDepartmentId,
        "createdBy": int.parse(userID),
        "CreatedDate": DateTime.now().toIso8601String(),
        // "CreatedDate": DateTime.now().toString().split(' ')[0],
        // Convert DateTime to string
      });
      print("Post added successfully.");
      Get.snackbar(
        'Success.',
        'Added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: QColors.success,
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
      Qrdata = {};
      isScan = true;
    } else {
      Get.snackbar(
        'Item Not added.',
        'Duplicate entry detected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: QColors.background2,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      Qrdata = {};
      isScan = true;
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

  Future<void> postApi() async {
    final url = '$postUrl';

    // Check if the list is empty
    if (postList.isEmpty) {
      Get.snackbar(
        'No data',
        'No items added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: QColors.background2,
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
    } else {
      try {
        // Perform the first HTTP request
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(postList),
        );

        if (response.statusCode == 200) {
          // Success
          Qrdata = {};
          scannedItems = [];
          isScan = false;
          postList = [];
          notifyListeners();
          Get.snackbar(
            'Saved',
            'Data saved successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
          );
        } else if (response.statusCode == 307) {
          // Handle redirect (307 status code)
          final redirectUrl = response.headers['location'];
          if (redirectUrl != null) {
            final newResponse = await http.post(
              Uri.parse(redirectUrl),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(postList),
            );
            if (newResponse.statusCode == 200) {
              // Success on the redirected request
              Qrdata = {};
              scannedItems = [];
              isScan = false;
              postList = [];
              notifyListeners();
              Get.snackbar(
                'Saved',
                'Data saved successfully after redirect',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            } else {
              // Handle failed redirected request
              Get.snackbar(
                'Error',
                'Failed to save data after redirect. Status code: ${newResponse.statusCode}',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            }
          } else {
            // If no redirect URL is found
            Get.snackbar(
              'Error',
              'Redirect URL not found',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
          }
        } else {
          // Handle other response statuses
          Get.snackbar(
            'Error',
            'Failed to save data. Status code: ${response.statusCode}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
          );
        }
      } catch (e) {
        // Catch any exceptions (network issues, JSON parsing issues, etc.)
        print("Error: $e");
        Get.snackbar(
          'Error',
          'Something went wrong: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }
}
