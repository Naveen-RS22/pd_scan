// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qapp_lite/utilities/helper_functions.dart';
// import 'package:toastification/toastification.dart';
//
// import 'colors.dart';
//
// class CustomSnackbar {
//   static void show(String title, String message) {
//     Get.snackbar(
//       title,
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Get.isDarkMode
//           ? Colors.white.withOpacity(0.9)
//           : Colors.black.withOpacity(0.8),
//       colorText: Get.isDarkMode ? Colors.black : Colors.white,
//       borderRadius: 20,
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(16),
//       duration: const Duration(seconds: 1),
//       maxWidth: Get.width * 0.7,
//       icon: Image.asset(
//         'assets/images/logo.png',
//         width: 28,
//         height: 28,
//       ),
//       shouldIconPulse: true,
//       isDismissible: true,
//       snackStyle: SnackStyle.FLOATING,
//     );
//   }
// }
//
// class CustomSnackbar2 {
//   static void show(BuildContext context, String title, String type) {
//     final dark = HelperFunctions.isDarkMode(context);
//
//     toastification.show(
//       context: context,
//       // Optional if you use ToastificationWrapper
//       type: type == 'success'
//           ? ToastificationType.success
//           : type == 'warning'
//               ? ToastificationType.warning
//               : ToastificationType.error,
//       style: type == 'warning'
//           ? ToastificationStyle.fillColored
//           : ToastificationStyle.flatColored,
//       autoCloseDuration: const Duration(seconds: 2),
//       title: Text(title),
//       // description:  RichText(
//       //   text: TextSpan(text: title),
//       // ),
//       alignment: Alignment.topCenter,
//       direction: TextDirection.ltr,
//       animationDuration: const Duration(milliseconds: 200),
//       animationBuilder: (context, animation, alignment, child) {
//         return FadeTransition(
//           opacity: animation, // Using opacity for fade effect
//           child: child,
//         );
//       },
//       icon: type == 'success'
//           ? Icon(Icons.check_circle)
//           : type == 'warning'
//               ? Icon(Icons.warning)
//               : Icon(Icons.error),
//
//       showIcon: true,
//       // Show or hide the icon
//       primaryColor: dark ? QColors.primary : QColors.primary,
//       backgroundColor: dark ? QColors.dark : QColors.lightContainer,
//       foregroundColor: dark ? QColors.textWhite : QColors.textPrimary,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: const [
//         BoxShadow(
//           color: Color(0x07000000),
//           blurRadius: 16,
//           offset: Offset(0, 16),
//           spreadRadius: 0,
//         ),
//       ],
//       showProgressBar: true,
//       progressBarTheme: ProgressIndicatorThemeData(color: QColors.secondary),
//       closeButtonShowType: CloseButtonShowType.onHover,
//       closeOnClick: false,
//       pauseOnHover: true,
//       dragToClose: true,
//       applyBlurEffect: true,
//       callbacks: ToastificationCallbacks(
//         onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
//         onCloseButtonTap: (toastItem) =>
//             print('Toast ${toastItem.id} close button tapped'),
//         onAutoCompleteCompleted: (toastItem) =>
//             print('Toast ${toastItem.id} auto complete completed'),
//         onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
//       ),
//     );
//   }
// }
