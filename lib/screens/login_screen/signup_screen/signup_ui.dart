// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:taskup/screens/home_screen/home_ui.dart';
// import 'package:taskup/screens/login_screen/login_ui.dart';
// import 'package:taskup/screens/login_screen/signup_screen/widgets/signup_form.dart';
// import 'package:taskup/screens/login_screen/widgets/login_form.dart';
// import 'package:taskup/utilities/helper_functions.dart';
//
// import '../../../utilities/sizes.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () => Get.offAll(() => LoginScreen()),
//             child:  Icon(Icons.arrow_back_ios_new,color: HelperFunctions.isDarkMode(context)?Colors.white60:Colors.black38,)),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 18),
//           child: Column(
//             children: [
//               Card(
//                 elevation: 4, // Shadow effect for the card
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100), // Circular card
//                 ),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 3,
//                   height:
//                       MediaQuery.of(context).size.width / 3, // Make it square
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/logo.png'),
//                       fit: BoxFit.cover, // Cover to maintain aspect ratio
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: QSizes.spaceBtwItems,
//               ),
//               Text(
//                 'Sign Up',
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ),
//               SizedBox(
//                 height: QSizes.spaceBtwSections,
//               ),
//               SignUpForm()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
