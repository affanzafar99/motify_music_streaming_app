import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/sigin_screen.dart';

class BackupRecoverScreen extends StatefulWidget {
  @override
  _BackupRecoverScreenState createState() => _BackupRecoverScreenState();
}

class _BackupRecoverScreenState extends State<BackupRecoverScreen> {
  //Form Key

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  //Editing Controller

  final TextEditingController firstController = new TextEditingController();
  final TextEditingController secondController = new TextEditingController();
  final TextEditingController thirdController = new TextEditingController();

  bool changeButton = false;

  moveToNext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await openDia();
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //This is Email Field
    final firstField = TextFormField(
      autofocus: false,
      controller: firstController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("Key phrase cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 5 key Character)");
        }
        return null;
      },
      onSaved: (value) {
        firstController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5.0, left: 30.0),
        hintText: "1st key phrase",

        hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,),

        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    //This is Password Field
    final secondField = TextFormField(
      autofocus: false,
      controller: secondController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("Key phrase cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid key phrase (Min. 5 Character)");
        }
        return null;
      },
      onSaved: (value) {
        secondController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5.0, left: 30.0),
        hintText: "6th key phrase",

        hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,),

        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    final thirdField = TextFormField(
      autofocus: false,
      controller: thirdController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("Key phrase cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid key phrase(Min. 5 Character)");
        }
        return null;
      },
      onSaved: (value) {
        thirdController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5.0, left: 30.0),
        hintText: "12th key phrase",

        hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,),

        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff0E0B2C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => moveToNext(context),
        child: Text(
          'Next',
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
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'asset/images/AppIcon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
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
                              "You're Almost Done!",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff0F0B2D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "I need to check you actually saved your key so you\nnever have to go through the pain of loosing your\nY Coin",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                color: Color(0xff0F0B2D),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        firstField,
                        SizedBox(
                          height: 20,
                        ),
                        secondField,
                        SizedBox(
                          height: 20,
                        ),
                        thirdField,
                        SizedBox(
                          height: 35,
                        ),
                        loginButton,
                        SizedBox(
                          height: 10,
                        ),
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

  openDia() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                'Your Y Coin wallet is backed up.\nSign In agin to continue.'),
            //title: Text('Registration Successful'),
            actions: <Widget>[
              MaterialButton(
                color: Color(0xff0F0B2D),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text(
                  'Okay',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }
}
