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

class RepostScreen extends StatefulWidget {
  const RepostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RepostScreen> createState() => _RepostScreenState();
}

class _RepostScreenState extends State<RepostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScanScreenViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: QColors.secondary,
        title: Text(
          'Report',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .apply(color: QColors.white),
        ),

        centerTitle: true,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(QSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Item",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                DropdownButton<String>(
                  value: viewModel.selecteditem,
                  hint: const Text("Select Item"),
                  items: viewModel.items.map((String itemName) {
                    return DropdownMenuItem<String>(
                      value: itemName,
                      child: Text(itemName),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    viewModel.setItems(newValue ?? "");
                  },
                  // style: TextStyle(color: QColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: QSizes.spaceBtwSections,
            ),
            if (viewModel.itemsHistoryList.isNotEmpty)
              ListView.builder(
                itemCount: viewModel.itemsHistoryList.length,
                shrinkWrap: true,
                // Adjust size based on the number of items
                physics: const NeverScrollableScrollPhysics(),
                // Prevents independent scrolling
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                itemBuilder: (context, index) {
                  final item = viewModel.itemsHistoryList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 120, // Set a fixed height for all cards
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Department : ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(color: !Get.isDarkMode?Colors.grey.shade700:Colors.white)!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  item['departmentName'].toString(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            const Divider(height: 20, color: Colors.grey),
                            Row(
                              children: [
                                Text(
                                  "Count: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(color: !Get.isDarkMode?Colors.grey.shade700:Colors.white)!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  item['count'].toString(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                },
              )
            else
              Center(
                child: Text(
                  "No data available",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
