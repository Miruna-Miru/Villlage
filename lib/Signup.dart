import 'package:flutter/material.dart';
import 'package:village/Login.dart';
import 'package:village/Petition.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _phoneNumber;
  late String _password;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents overflow when keyboard appears
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                            "InfoLink",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 32,
                            ),
                          ),
                          const Text(
                            "Your village, Your updates",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 22),
                          const Text(
                            "Welcome!!",
                            style: TextStyle(color: Colors.grey, fontSize: 28),
                          ),
                          // Phone Number Field
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                hintText: "Phone Number",
                                prefixIcon: const Icon(Icons.phone, color: Colors.green),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                              ),
                              onSaved: (value) => _phoneNumber = value!,
                            ),
                          ),
                          // Username Field
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "UserName",
                                hintText: "UserName",
                                prefixIcon: const Icon(Icons.person, color: Colors.green),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                              ),
                              onSaved: (value) => _username = value!,
                            ),
                          ),
                          // Password Field
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
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.green),
                                ),
                              ),
                              onSaved: (value) => _password = value!,
                            ),
                          ),
                          // SignUp Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Handle signup action here
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              "SignUp",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Divider with "or" text
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                  thickness: 1,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "or",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Google Sign In Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle Google sign-in action here
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/img.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          // Login Redirect
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an Account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Petition()),
                                  );
                                },
                                child: const Text(
                                  "Login",
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
