
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pd_scan/screens/login_screen/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/sizes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: QSizes.spaceBtwSections),
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: viewModel.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: 'Username',
            ),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter your email';
            //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            //     return 'Please enter a valid email';
            //   }
            //   return null;
            // },
          ),
          const SizedBox(height: QSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: viewModel.passwordController,
            obscureText: viewModel.obscurePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(viewModel.obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    viewModel.obscurePassword = !viewModel.obscurePassword;
                  });
                },
              ),
            ),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter your password';
            //   } else if (value.length < 6) {
            //     return 'Password must be at least 6 characters long';
            //   }
            //   return null;
            // },
          ),
          const SizedBox(height: QSizes.spaceBtwInputFields / 2),

          // // Remember me & Forgot Password
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     // Remember me
          //     Row(
          //       children: [
          //         Checkbox(value: true, onChanged: (value) {}),
          //         const Text('Remember me'),
          //       ],
          //     ),
          //
          //     // Forgot Password
          //     TextButton(
          //       onPressed: () => Get.to(() => null),
          //       child: Text(
          //         'Forgot password',
          //         style: Theme.of(context)
          //             .textTheme
          //             .labelMedium!
          //             .apply(color: QColors.accent),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: QSizes.spaceBtwSections),

          // Sign In button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                viewModel.signInWithEmailPassword();
              },
              child: Text(
                'Log In',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: QColors.background),
              ),
            ),
          ),
          const SizedBox(height: QSizes.spaceBtwItems),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => null),
              child: Text(
                'Create account',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
