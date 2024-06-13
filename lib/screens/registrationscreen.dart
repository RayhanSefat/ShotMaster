import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stancebeam/screens/loginscreen.dart';

import 'reg/1.tellaboutscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool agree = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore ref = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  TextEditingController role = TextEditingController(text: 'Role');
  final _formKey = GlobalKey<FormState>();
  bool hide = true;
  // String role = 'Player';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE75B42),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Transform.translate(
            offset: Offset(0, -275),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 550,
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
                        'Register',
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        'Enter the credentials below to create your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
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
                              obscureText: hide,
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
                            TextFormField(
                              obscureText: hide,
                              controller: cpass,
                              decoration: InputDecoration(
                                hintText: 'Re-enter Password',
                                labelText: 'Re-enter Password',
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: agree,
                                    onChanged: (v) {
                                      setState(() {
                                        agree = v!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 25),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'I agree to ShotMaster '),
                                          TextSpan(
                                            text: 'TERMS OF USE ',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color(0xffE75B42)),
                                          ),
                                          TextSpan(text: 'and '),
                                          TextSpan(
                                            text: 'PRIVACY POLICY',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color(0xffE75B42)),
                                          ),
                                        ],
                                      ),
                                      textScaleFactor: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffE75B42),
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 55),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (agree == false) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'Please agree to ShotMaster TERMS OF USE and PRIVACY POLICY');
                                    return;
                                  }

                                  if (pass.text != cpass.text) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'Passwords do not match. Please try again');
                                    return;
                                  }
                                  try {
                                    var user = await auth
                                        .createUserWithEmailAndPassword(
                                            email: email.text,
                                            password: pass.text);
                                    await user.user!
                                        .updateDisplayName(name.text);
                                    await ref
                                        .collection('users')
                                        .doc(user.user!.uid)
                                        .set({
                                      'uid': user.user!.uid,
                                      'name': name.text,
                                      'email': email.text,
                                      'role': role.text,
                                    });
                                    await auth.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()),
                                        (route) => false);
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: Text(
                        'Sign In',
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
