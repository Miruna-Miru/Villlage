import 'package:flutter/material.dart';
import 'package:village/Signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  bool _saving = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents pixel overflow when keyboard appears
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    color: Colors.white,
                    width: screenSize.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Text(
                            "Hello Again!!",
                            style: TextStyle(color: Colors.grey, fontSize: 28),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Email",
                                prefixIcon: const Icon(Icons.email, color: Colors.green),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                } else if (!value.contains('@') || !value.contains('.')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onSaved: (value) => _email = value!,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.password, color: Colors.green),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.green,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                              onSaved: (value) => _password = value!,
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Colors.lightBlueAccent),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Perform the login action
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "New user?",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUp()),
                                  );
                                },
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(color: Colors.lightBlueAccent),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
