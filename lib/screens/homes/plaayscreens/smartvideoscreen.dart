import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SmartVideoScreen extends StatefulWidget {
  const SmartVideoScreen({super.key});

  @override
  State<SmartVideoScreen> createState() => _SmartVideoScreenState();
}

class _SmartVideoScreenState extends State<SmartVideoScreen> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Video and Stats'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: selected ? 3 : 1,
                      color: selected ? Color(0xffDF8776) : Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/have.png'),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Reza',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Right Handed Bat',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text('Change Player'),
                            SizedBox(width: 15),
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
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          onPressed: () {
            if (selected) {
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>))
            } else {
              Fluttertoast.showToast(msg: 'No session selected');
            }
          },
          child: Text(
            'Start Session',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
