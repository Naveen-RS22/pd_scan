import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pd_scan/screens/login_screen/login_ui.dart';
import 'package:pd_scan/screens/scan_screen/scan_view_model.dart';
import 'package:pd_scan/utilities/sizes.dart';
import 'package:pd_scan/utilities/storage.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utilities/colors.dart'; // Assuming your custom colors are defined here

class ScanScreen extends StatefulWidget {
  final String userId;
  final String userName;

  const ScanScreen({Key? key, required this.userId, required this.userName})
      : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<ScanScreenViewModel>(context, listen: false);
    viewModel.onGetInit(widget.userId,widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScanScreenViewModel>(context, listen: true);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: QColors.secondary,
          title: Text('Report'),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     // User Profile and Welcome Text
          //     Row(
          //       children: [
          //         CircleAvatar(
          //           backgroundColor: Colors.white,
          //           child: Icon(Icons.person, color: QColors.secondary),
          //         ),
          //         const SizedBox(width: 10),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Welcome",
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .titleLarge!
          //                   .apply(color: QColors.white),
          //             ),
          //             Text(
          //               widget.userName,
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .subtitle1!
          //                   .apply(color: QColors.white),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //     // Actions (e.g., settings icon)
          //     IconButton(
          //       icon: const Icon(Icons.logout),
          //       color: QColors.white,
          //       onPressed: () {
          //         Get.offAll(() => const LoginScreen());
          //         QStorage.clearStorage();
          //       },
          //     ),
          //   ],
          // ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [QColors.primary, QColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(QSizes.defaultSpace),
          child: Column(
          children: [],
          ),
        ),
      ),
    );
  }
}
