import 'package:flutter/material.dart';
import 'package:stancebeam/screens/bottombar.dart';

class LetsGoPage extends StatefulWidget {
  const LetsGoPage({super.key});

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}

class _LetsGoPageState extends State<LetsGoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left, color: Colors.grey),
        ),
      ),
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'Let\'s Go!',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'Please choose an option from below',
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => BottomBar()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/have.png',
                        width: 65,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            title: Text(
                              'I have a ShotMaster',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Get to know how to install and use ShotMaster',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25)),
                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    color: Color(0xffE75B42),
                                    child: Icon(Icons.arrow_forward)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     margin: EdgeInsets.only(top: 25),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         border: Border.all(color: Colors.grey),
            //         borderRadius: BorderRadius.circular(25)),
            //     child: Row(
            //       children: [
            //         ClipRRect(
            //             borderRadius: BorderRadius.circular(25),
            //             child: Image.asset('assets/explore.png')),
            //         Expanded(
            //           child: Column(
            //             children: [
            //               ListTile(
            //                 title: Text(
            //                   'Explore ShotMaster app',
            //                   style: TextStyle(fontWeight: FontWeight.bold),
            //                 ),
            //                 subtitle: Text(
            //                   'You can record, share session videos and drills without',
            //                   style: TextStyle(color: Colors.grey),
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Spacer(),
            //                   ClipRRect(
            //                     borderRadius: BorderRadius.only(
            //                         bottomRight: Radius.circular(25)),
            //                     child: Container(
            //                         padding: EdgeInsets.all(7),
            //                         color: Color(0xffE5F6FE),
            //                         child: Icon(Icons.arrow_forward)),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                side: BorderSide(color: Colors.black),
                fixedSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              onPressed: () {},
              child: Text(
                'I Don\'t Have Striker',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {},
        child: Text(
          'Skip for Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffEDC670),
          ),
        ),
      ),
    );
  }
}
