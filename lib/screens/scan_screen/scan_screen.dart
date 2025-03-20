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

import '../../utilities/colors.dart';
import '../report_screen/report_screen.dart'; // Assuming your custom colors are defined here

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
    viewModel.onGetInit(widget.userId, widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScanScreenViewModel>(context, listen: true);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        drawerEnableOpenDragGesture: true, // Ensures swipe to open works

        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: QColors.secondary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User Profile and Welcome Text
              Row(
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   child: Icon(Icons.person, color: QColors.secondary),
                  // ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: QColors.white)
                            .copyWith(letterSpacing: 3),
                      ),
                      Text(
                        widget.userName,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .apply(color: QColors.white),
                      ),
                    ],
                  ),
                ],
              ),
              // Actions (e.g., settings icon)
              Row(
                children: [
                  Tooltip(
                    message: "Report",
                    child: IconButton(
                      icon: const Icon(Icons.report),
                      color: QColors.white,
                      onPressed: () {
                        Get.to(() => RepostScreen());
                        viewModel.getitems();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    color: QColors.white,
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                      QStorage.clearStorage();
                    },
                  ),
                ],
              ),
            ],
          ),
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [QColors.primary, QColors.secondary],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //   ),
          // ),
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {
          //     Get.to(() => RepostScreen());
          //     viewModel.getitems();
          //   },
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(QSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Department",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  AbsorbPointer(
                    absorbing: viewModel.postList.isNotEmpty,
                    child: DropdownButton<String>(
                      value: viewModel.selectedDepartment,
                      hint: const Text("Select Department"),
                      items: viewModel.departments.map((String department) {
                        return DropdownMenuItem<String>(
                          value: department,
                          child: Text(department),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        viewModel.setDepartment(newValue ?? "");
                      },
                      // style: TextStyle(color: QColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: QSizes.spaceBtwSections),
              ElevatedButton(
                onPressed: () {
                  viewModel.setIsScan();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: QColors.primary,
                ),
                child: Text(
                  !viewModel.isScan ? "Start Scanning" : "Stop Scanning",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: QSizes.spaceBtwSections),
              if (viewModel.isScan)
                SizedBox(
                  height: 100,
                  width: 300,
                  child: QRView(
                    key: viewModel.qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      controller.scannedDataStream.listen((scanData) {
                        setState(() {
                          viewModel.setBarCode(scanData.code!);
                        });
                        controller.stopCamera();
                      });
                    },
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 20,
                      borderWidth: 5,
                      cutOutSize: 300,
                    ),
                  ),
                ),
              const SizedBox(height: QSizes.spaceBtwSections),
              // Column(
              //   children: [
              //     Row(
              //
              //       children: [
              //         Text(
              //           "BardCode",
              //           style: Theme.of(context)
              //               .textTheme
              //               .titleLarge,
              //         ),
              //         Spacer(),
              //         Text(
              //           viewModel.scannedData,
              //           style: Theme.of(context)
              //               .textTheme
              //               .titleLarge,
              //         ),
              //       ],
              //     ),  Row(
              //       children: [
              //         Text(
              //           "Item Name",
              //           style: Theme.of(context)
              //               .textTheme
              //               .titleLarge,
              //         ),
              //         Spacer(),
              //
              //         Text(
              //           'asad',
              //           style: Theme.of(context)
              //               .textTheme
              //               .titleLarge,
              //         ),
              //       ],
              //     ),
              //
              //   ],
              // ),
              // const SizedBox(height: QSizes.spaceBtwSections),
              if (viewModel.Qrdata.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            viewModel.Qrdata['itemBarCode'].toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            viewModel.Qrdata['itemName'].toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              const SizedBox(height: QSizes.spaceBtwSections),
              if (viewModel.Qrdata.isNotEmpty)

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.addPost();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: QColors.secondary),
                      child: const Text("Add"),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: QColors.secondary),
                      child: const Text("Clear"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: QSizes.spaceBtwSections),
              // Expanded(
              //   child: CarouselSlider(
              //     items: viewModel.postList.asMap().entries.map((entry) {
              //       int index = entry.key; // Get the index
              //       Map<String, dynamic> item = entry.value; // Get the item
              //
              //       return Stack(
              //         children: [
              //           Card(
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             elevation: 4,
              //             margin: const EdgeInsets.symmetric(vertical: 8),
              //             child: Container(
              //               height: 120, // Set a fixed height for all cards
              //               padding: const EdgeInsets.all(16.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Row(
              //                     children: [
              //                       Text(
              //                         "BarCode : ",
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall!
              //                             .apply(
              //                                 color: !Get.isDarkMode
              //                                     ? Colors.grey.shade700
              //                                     : Colors.white)!
              //                             .copyWith(
              //                                 fontWeight: FontWeight.bold),
              //                       ),
              //                       Text(
              //                         item['itemBarCode'].toString(),
              //                         style:
              //                             Theme.of(context).textTheme.bodyLarge,
              //                       ),
              //                     ],
              //                   ),
              //                   const Divider(height: 20, color: Colors.grey),
              //                   Row(
              //                     children: [
              //                       Text(
              //                         "itemName: ",
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall!
              //                             .apply(
              //                                 color: !Get.isDarkMode
              //                                     ? Colors.grey.shade700
              //                                     : Colors.white)!
              //                             .copyWith(
              //                                 fontWeight: FontWeight.bold),
              //                       ),
              //                       Text(
              //                         item['itemName'].toString(),
              //                         style:
              //                             Theme.of(context).textTheme.bodyLarge,
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           // Card(
              //           //   color: Colors.blue.shade50,
              //           //   child: Center(
              //           //     child: Column(
              //           //       mainAxisAlignment: MainAxisAlignment.center,
              //           //       children: [
              //           //         Text(
              //           //           item['itemBarCode'].toString(),
              //           //           style: const TextStyle(fontSize: 16),
              //           //         ),
              //           //         Text(
              //           //           item['itemName'].toString(),
              //           //           style: const TextStyle(fontSize: 16),
              //           //         ),
              //           //       ],
              //           //     ),
              //           //   ),
              //           // ),
              //           Container(
              //             decoration: BoxDecoration(
              //               color: QColors.accent,
              //               borderRadius: BorderRadius.circular(
              //                   10), // Adjust border radius
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.all(4.0),
              //               child: Text(
              //                 '${index + 1}',
              //                 style: const TextStyle(
              //                     fontSize: 16, color: Colors.white),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             right: 0,
              //             child: IconButton(
              //               onPressed: () {
              //                 viewModel.removeList(
              //                     index); // Pass the index to remove the item
              //               },
              //               icon: const Icon(Icons.cancel),
              //             ),
              //           ),
              //         ],
              //       );
              //     }).toList(),
              //     options: CarouselOptions(
              //       height: 120,
              //       enableInfiniteScroll: false,
              //       enlargeCenterPage: true,
              //       viewportFraction: 0.8,
              //       onPageChanged: (index, _) =>
              //           viewModel.updatePageIndicator(index),
              //     ),
              //   ),
              // ),
              // if (viewModel.postList.isNotEmpty)
              //   Center(
              //     child: Obx(
              //       () => SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             for (int i = 0; i < viewModel.postList.length; i++)
              //               Container(
              //                 height: 4,
              //                 width: 20,
              //                 color: viewModel.carousalCurrentIndex.value == i
              //                     ? QColors.secondary
              //                     : QColors.grey,
              //                 margin: EdgeInsets.only(right: 10),
              //               ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              if (viewModel.postList.isNotEmpty)
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: viewModel.postList.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.postList[index];
                        return Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "BarCode: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .apply(
                                                  color: Colors.grey.shade700)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Expanded( // Prevents overflow
                                          child: Text(
                                            item['itemBarCode'].toString(),
                                            overflow: TextOverflow.ellipsis, // Adds "..." when text overflows
                                            maxLines: 1, // Keeps it in one line
                                            softWrap: false,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        height: 20, color: Colors.grey),
                                    Row(
                                      children: [
                                        Text(
                                          "ItemName: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .apply(
                                                  color: Colors.grey.shade700)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Expanded( // Prevents overflow
                                          child: Text(
                                            item['itemName'].toString(),
                                            overflow: TextOverflow.ellipsis, // Adds "..." when text overflows
                                            maxLines: 1, // Keeps it in one line
                                            softWrap: false,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  viewModel.removeList(index);
                                },
                                icon: const Icon(Icons.cancel),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: () {
              viewModel.postApi();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: QColors.primary,
            ),
            child: Text(
              "Save Data ${viewModel.postList.isNotEmpty ? '(${viewModel.postList.length})' : ''}",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
