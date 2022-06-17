import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_uicreation/model/user.dart';
import 'package:flutter_uicreation/screens/SignUp/currency.dart';
import 'package:flutter_uicreation/service/service_country.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'dart:async';

import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UserFilterDemo extends StatefulWidget {
  UserFilterDemo() : super();

  final String title = "Filter List Demo";

  @override
  UserFilterDemoState createState() => UserFilterDemoState();
}

class Debouncer {
  late final int milliseconds;
  late VoidCallback action;
  var _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class UserFilterDemoState extends State<UserFilterDemo> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<User> users = [];
  List<User> filteredUsers = [];
  int? selectedIndex;

  //Error Msg Display

  final errorMsgsnackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    spreadRadius: 2.0,
                    blurRadius: 8.0,
                    offset: Offset(2, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text("Please Select Language",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 15,
                  ),
                ],
              )),
        ],
      ),
    ),
  );

  //Success Message Dsiplay

  final sucessMsgsnackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFF00C608),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    spreadRadius: 2.0,
                    blurRadius: 8.0,
                    offset: Offset(2, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.check_mark,
                      color: Color(0xffFFFFFF)),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Language updated',
                        style: TextStyle(color: Color(0xffFFFFFF))),
                  ),
                  const Spacer(),
                  // TextButton(
                  //     onPressed: () => debugPrint("Undid"), child: Text("Undo")),
                  const Icon(CupertinoIcons.xmark,
                      color: Color(0xffFFFFFF), size: 15),
                ],
              )),
        ],
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Choose Language",
          style: TextStyle(
              color: Color(0xff0F0B2D),
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Hello James",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0F0B2D)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Please select a language",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff0F0B2D)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.black.withAlpha(7),
                    filled: true,

                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    border: InputBorder.none,
                    hintText: "Search Your Country",
                    hintStyle: TextStyle(
                        color: Color(0xff6E767D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff6E767D),
                    )),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      filteredUsers = users
                          .where((u) => (u.name
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                          .toList();
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filteredUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  print(filteredUsers[index].image);
                  return Card(
                    elevation: 0.0,

                    color: Colors.black.withAlpha(7),
                    //color: Color(0xff00000008),
                    //shadowColor: Color(0xffE5E5E5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        //tileColor: Colors.black.withAlpha(7),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            print(selectedIndex);
                          });
                        },
                        leading: SvgPicture.network(filteredUsers[index].image),
                        title: Text(
                          filteredUsers[index].name,
                          style: TextStyle(
                              color: Color(0xff0F0B2D),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        trailing: selectedIndex == index
                            ? Icon(
                                Icons.check,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff0E0B2C), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    child: MaterialButton(
                      height: 58.0,
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width / 3,
                      onPressed: () {
                        if (selectedIndex == null) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message: "please select language ",
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              iconPositionLeft: 290,
                              iconRotationAngle: 0,
                            ),
                          );
                        } else {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: "Language updated - ",
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              iconPositionLeft: 290,
                              iconRotationAngle: 0,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CurrencyScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff0E0B2C),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),

                  color: Color(0xff0E0B2C),
                  child: MaterialButton(
                    height: 58.0,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width / 3,
                    onPressed: () {
                      if (selectedIndex == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(errorMsgsnackBar);
                        // showTopSnackBar(
                        //   context,
                        //   CustomSnackBar.error(
                        //     message: "please select language ",
                        //     icon: Icon(
                        //       Icons.cancel,
                        //       color: Colors.white,
                        //     ),
                        //     iconPositionLeft: 290,
                        //     iconRotationAngle: 0,
                        //   ),
                        // );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sucessMsgsnackBar);
                        // showTopSnackBar(
                        //   context,
                        //   CustomSnackBar.success(
                        //     message: "Language updated - ",
                        //     icon: Icon(
                        //       Icons.cancel,
                        //       color: Colors.white,
                        //     ),
                        //     iconPositionLeft: 290,
                        //     iconRotationAngle: 0,
                        //   ),
                        // );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CurrencyScreen()));
                      }
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
