import 'package:flutter/material.dart';
import 'package:pd_scan/screens/login_screen/widgets/login_form.dart';



import '../../utilities/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading:false
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 0,
              left: 18,
              right: 18,
              bottom: 18),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3, // Make it square
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/out.png'),
                    // fit: BoxFit.fill, // Cover to maintain aspect ratio
                  ),
                ),
              ),
              const SizedBox(height: QSizes.spaceBtwItems,),
              Text('Login',style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: QSizes.spaceBtwSections,),
        
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}

