import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/reset_password.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  //Form Key

  final _formKey = GlobalKey<FormState>();

  //Editing Controller

  //final TextEditingController passwordController = new TextEditingController();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final thirdNameEditingController = new TextEditingController();

  final fourthNameEditingController = new TextEditingController();
  final fifthNameEditingController = new TextEditingController();
  final sixNameEditingController = new TextEditingController();

  final sevenNameEditingController = new TextEditingController();
  final eightNameEditingController = new TextEditingController();
  final nineNameEditingController = new TextEditingController();

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
            builder: (context) => ResetPwScreen(),
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
          'Send',
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
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'asset/images/AppIcon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot password',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Please enter your backup phrases to reset your\npassword',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0, right: 40.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: firstNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   RegExp regex = new RegExp(r'^.{3,}$');
                                  //   if (value!.isEmpty) {
                                  //     return ("Empty");
                                  //   }
                                  //   if (!regex.hasMatch(value)) {
                                  //     return ("Enter Valid name(Min. 3 Character)");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    firstNameEditingController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 5.0, left: 30.0),
                                    hintText: "First",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Second Name Field
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: secondNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return ("Second Name cannot be Empty");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    secondNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Second",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          //Third Text Field

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: thirdNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return ("Second Name cannot be Empty");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    thirdNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Third",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0, right: 40.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: fourthNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   RegExp regex = new RegExp(r'^.{3,}$');
                                  //   if (value!.isEmpty) {
                                  //     return ("Empty");
                                  //   }
                                  //   if (!regex.hasMatch(value)) {
                                  //     return ("Enter Valid name(Min. 3 Character)");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    fourthNameEditingController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 5.0, left: 30.0),
                                    hintText: "First",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Second Name Field
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: fifthNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return ("Second Name cannot be Empty");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    fifthNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Second",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          //Third Text Field

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: sixNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {

                                  // },
                                  onSaved: (value) {
                                    sixNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Third",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0, right: 40.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: sevenNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   RegExp regex = new RegExp(r'^.{3,}$');
                                  //   if (value!.isEmpty) {
                                  //     return ("Empty");
                                  //   }
                                  //   if (!regex.hasMatch(value)) {
                                  //     return ("Enter Valid name(Min. 3 Character)");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    sevenNameEditingController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 5.0, left: 30.0),
                                    hintText: "First",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          //Second Name Field
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: eightNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return ("Second Name cannot be Empty");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    eightNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Second",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          //Third Text Field

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: EdgeInsets.only(left: 5.0),
                                height: MediaQuery.of(context).size.height / 8,
                                width: 100,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: nineNameEditingController,
                                  keyboardType: TextInputType.name,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return ("Second Name cannot be Empty");
                                  //   }
                                  //   return null;
                                  // },
                                  onSaved: (value) {
                                    nineNameEditingController.text = value!;
                                  },

                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5.0, left: 20.0),
                                    hintText: "Third",

                                    //hintStyle: TextStyle(color: Colors.black,),

                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFFF1F1F1), width: 3),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //passwordField,
                    SizedBox(
                      height: 10,
                    ),
                    loginButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
