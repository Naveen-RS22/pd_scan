// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:taskup/navigation_bar.dart';
// import 'package:taskup/screens/home_screen/home_ui.dart';
// import 'package:taskup/screens/login_screen/login_ui.dart';
// import 'package:taskup/utilities/colors.dart';
//
// import '../../../../utilities/sizes.dart';
//
// class SignUpForm extends StatefulWidget {
//   const SignUpForm({super.key});
//
//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }
//
// class _SignUpFormState extends State<SignUpForm> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//
//   // final _formKey = GlobalKey<FormState>(); // Form key for validation
//   bool _obscurePassword = true; // For toggling password visibility
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   Future<void> createUser() async {
//     // Show a loading indicator
//     Get.dialog(
//       Center(child: CircularProgressIndicator()),
//       barrierDismissible: false, // Prevent dismissing the dialog
//     );
//
//     try {
//       // Create a new user with email and password
//       final UserCredential credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//
//       // Optional: Send a verification email
//       await credential.user?.sendEmailVerification();
//
//       // Navigate to the home screen or another screen
//       Get.offAll(() =>
//           const LoginScreen()); // Use Get.offAll to remove previous routes
//
//       // Optionally, show a success message
//       Get.snackbar(
//         'Account Created',
//         'A verification email has been sent to ${_emailController.text.trim()}.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 3),
//       );
//     } on FirebaseAuthException catch (e) {
//       // Handle specific Firebase exceptions
//       String errorMessage;
//
//       switch (e.code) {
//         case 'weak-password':
//           errorMessage = 'The password provided is too weak.';
//           break;
//         case 'email-already-in-use':
//           errorMessage = 'The account already exists for that email.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address is not valid.';
//           break;
//         default:
//           errorMessage = 'An error occurred. Please try again.';
//       }
//
//       // Show the error message using Snackbar
//       Get.snackbar(
//         'Registration Error',
//         errorMessage,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 3),
//       );
//     } catch (e) {
//       // Handle other exceptions
//       Get.snackbar(
//         'Unexpected Error',
//         'An unexpected error occurred. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 3),
//       );
//     } finally {
//       // Close the loading indicator
//       Get.back(); // Dismiss the loading dialog
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: QSizes.spaceBtwSections),
//       // child: Form(
//       // key: _formKey, // Assign form key to Form widget
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _nameController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.direct_right),
//               labelText: 'Name',
//             ),
//             // validator: (value) {
//             //   if (value == null || value.isEmpty) {
//             //     return 'Please enter your email';
//             //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//             //     return 'Please enter a valid email';
//             //   }
//             //   return null;
//             // },
//           ),
//           const SizedBox(height: QSizes.spaceBtwInputFields),
//           // Email
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Iconsax.direct_right),
//               labelText: 'E-mail',
//             ),
//             // validator: (value) {
//             //   if (value == null || value.isEmpty) {
//             //     return 'Please enter your email';
//             //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//             //     return 'Please enter a valid email';
//             //   }
//             //   return null;
//             // },
//           ),
//           const SizedBox(height: QSizes.spaceBtwInputFields),
//
//           // Password
//           TextFormField(
//             controller: _passwordController,
//             obscureText: _obscurePassword,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Iconsax.password_check),
//               labelText: 'Password',
//               suffixIcon: IconButton(
//                 icon: Icon(_obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
//                 onPressed: () {
//                   setState(() {
//                     _obscurePassword = !_obscurePassword;
//                   });
//                 },
//               ),
//             ),
//             // validator: (value) {
//             //   if (value == null || value.isEmpty) {
//             //     return 'Please enter your password';
//             //   } else if (value.length < 6) {
//             //     return 'Password must be at least 6 characters long';
//             //   }
//             //   return null;
//             // },
//           ),
//           const SizedBox(height: QSizes.spaceBtwInputFields / 2),
//
//           // Remember me & Forgot Password
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     // Remember me
//           //     Row(
//           //       children: [
//           //         Checkbox(value: true, onChanged: (value) {}),
//           //         const Text('Remember me'),
//           //       ],
//           //     ),
//           //
//           //     // Forgot Password
//           //     // TextButton(
//           //     //   onPressed: () => Get.to(() => null),
//           //     //   child: Text(
//           //     //     'Forgot password',
//           //     //     style: Theme.of(context)
//           //     //         .textTheme
//           //     //         .labelMedium!
//           //     //         .apply(color: QColors.accent),
//           //     //   ),
//           //     // ),
//           //   ],
//           // ),
//           const SizedBox(height: QSizes.spaceBtwSections),
//
//           // Sign In button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => createUser(),
//               child: Text(
//                 'Sign Up',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .apply(color: QColors.background),
//               ),
//             ),
//           ),
//           const SizedBox(height: QSizes.spaceBtwItems),
//
//           TextButton(
//             onPressed: () => Get.offAll(() => const LoginScreen()),
//             child: Text(
//               'back to login?',
//               style: Theme.of(context)
//                   .textTheme
//                   .labelMedium!
//                   .apply(color: QColors.accent),
//             ),
//           ),
//         ],
//       ),
//       // ),
//     );
//   }
// }
