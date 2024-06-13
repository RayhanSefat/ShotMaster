import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stancebeam/screens/reg/1.tellaboutscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController role = TextEditingController(text: 'Role');
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE75B42),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Transform.translate(
            offset: Offset(0, -250),
            child: Column(
              children: [
                Container(
                  height: 500,
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: MediaQuery.of(context).size.height / 2),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        'Enter the credentials below to continue',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                              validator: (email) {
                                if (email!.contains('@')) return null;
                                return 'Please enter a valid email';
                              },
                            ),
                            TextFormField(
                              controller: pass,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                isDense: true,
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hide = !hide;
                                    });
                                  },
                                  child: Icon(hide
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must contain 8 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            DropdownMenu(
                              controller: role,
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                    enabled: false,
                                    value: 'Role',
                                    label: 'Select Your Role'),
                                DropdownMenuEntry(
                                    value: 'Player', label: 'Player'),
                                DropdownMenuEntry(
                                    value: 'Coach', label: 'Coach'),
                              ],
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffE75B42),
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 55),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await auth.signInWithEmailAndPassword(
                                        email: email.text, password: pass.text);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => TellAboutScreen()),
                                        (route) => false);
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  }
                                }
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Row(
                                children: [
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style:
                                          TextStyle(color: Color(0xffE75B42)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/google.png',
                                  width: 30,
                                ),
                                Text('Google'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
