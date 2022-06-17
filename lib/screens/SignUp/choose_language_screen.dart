import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var imgList = [
    "asset/images/in.png",
    "asset/images/io.png",
    "asset/images/iq.png",
    "asset/images/ir.png",
    "asset/images/is.png",
    "asset/images/it.png",
    "asset/images/je.png",
    "asset/images/jm.png",
    "asset/images/jo.png",
    "asset/images/jp.png",
    "asset/images/ke.png",
    "asset/images/kg.png"
  ];

  var nameList = [
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Isreal",
    "Italy",
    "Ivory Coast",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Choose Language",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello James",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Please select a language",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              //SearchView
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search Your Country",
                    prefixIcon: Icon(
                      Icons.search,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              //listView
              Expanded(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: imgList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // This Will Call When User Click On ListView Item
                          //showDialogFunc(context, imgList[index], nameList[index], roleList[index]);
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(
                                imgList[index],
                                fit: BoxFit.contain,
                              ),
                              title: Text(nameList[index]),
                              trailing: IconButton(
                                icon: Icon(Icons.arrow_right_alt_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                  ElevatedButton(onPressed: () {}, child: Text("Next")),
                ],
              ),
            ]),
      ),
    );
  }
}
