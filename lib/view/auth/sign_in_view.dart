import 'package:flutter/material.dart';
import 'sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: const Color(0xFFDAF2FA), // Light blue background
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // Image.asset('assets/logo.png', height: 80), // Logo (Commented out)
                        const SizedBox(height: 20),
                        ToggleButtons(
                          isSelected: viewModel.isSelected,
                          onPressed: (index) => viewModel.toggleIndex(index),
                          borderRadius: BorderRadius.circular(8.0),
                          fillColor: const Color(0xFF52B5E6),
                          selectedColor: Colors.white,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Email Address'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(' Phone Number'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (viewModel.isEmailSelected)
                          TextField(
                            controller: viewModel.emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    const BorderSide(color: Color(0xFFD9D9D9)),
                              ),
                            ),
                          )
                        else
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: viewModel.countryCodeController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child:
                                          Icon(Icons.flag), // Placeholder icon
                                      // child: Image.asset('assets/flag.png'), // Flag image (Commented out)
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          const BorderSide(color: Color(0xFFD9D9D9)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: TextField(
                                  controller: viewModel.phoneNumberController,
                                  decoration: InputDecoration(
                                    labelText: '(MY) +60 Phone Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          const BorderSide(color: Color(0xFFD9D9D9)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                // Add visibility toggle functionality
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => viewModel.signIn(context),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF52B5E6),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: viewModel.verificationCodeSignIn,
                              child: const Text(
                                'PIN Code Login',
                                style: TextStyle(color: Color(0xFF52B5E6)),
                              ),
                            ),
                            TextButton(
                              onPressed: viewModel.forgotPassword,
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(color: Color(0xFF52B5E6)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Image.asset('assets/footer_image.png', height: 80), // Footer image (Commented out)
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Unable to log in?'),
                      TextButton(
                        onPressed: viewModel.contactUs,
                        child: const Text(
                          'Please Contact Us if you need help',
                          style: TextStyle(color: Color(0xFF52B5E6)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please indicate that you agree to the User Service Agreement of LittleLives and have read our Privacy Policy by creating or logging in an account.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
