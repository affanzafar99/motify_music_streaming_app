import 'package:flutter/material.dart';

import 'package:flutter_uicreation/screens/SignUp/backup_recovery_screen.dart';

class BackUp extends StatefulWidget {
  @override
  _BackUpState createState() => _BackUpState();
}

class _BackUpState extends State<BackUp> {
  //Form Key

  final _formKey = GlobalKey<FormState>();

  //Editing Controller

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final thirdNameEditingController = new TextEditingController();
  bool changeButton = false;

  moveToNext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BackupRecoverScreen(),
          ));
      ;
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff0E0B2C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => moveToNext(context),
        child: Text(
          'Continue',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'asset/images/AppIcon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Color(0xffF1F1F1),
                  thickness: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Nice Username james!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff0F0B2D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Now, these are your backup keys. If you ever'
                              '\nneed to import your wallet onto a new device you'
                              '\nwill need these! keep these safe and don not show'
                              '\nthem to anyone as they can get access to your'
                              '\naccount if you do.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff0F0B2D),
                                  height: 1.5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        Container(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "1.chocolate",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        color: Color(0xff0F0B2D),
                                      ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "2. Potato",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff0F0B2D)
                                                ),
                                    ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFF1F1F1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "3. Brocoli",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                        ))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "4. Chips",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "5. Cookie",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFF1F1F1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "6. Auto",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                        ))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        Container(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "7. New York",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "8. Chrome",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFF1F1F1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "9. Mugs",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff0F0B2D)
                                                ),
                                        ))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "10. Cars",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        child: Center(
                                            child: Text(
                                      "11. Shop",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                    ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(right: 20.0),
                                    height: 48,
                                    width: 106,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFF1F1F1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "12. Classic",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0F0B2D)
                                              ),
                                        ))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '* Please note these crypto key phrases somewhere\n   and keep it safe.',
                              style: TextStyle(color:Color(0xff0F0B2D),height: 1.5,fontSize: 14,fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),

                        //passwordField,
                        SizedBox(
                          height: 35,
                        ),
                        loginButton,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
