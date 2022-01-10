import 'dart:math';
import 'package:flutter/material.dart';

class AddAllergies extends StatefulWidget {
  const AddAllergies({Key? key}) : super(key: key);

  @override
  _AddAllergiesState createState() => _AddAllergiesState();
}

class _AddAllergiesState extends State<AddAllergies> {
  List<ContactModel> allergies = [
    ContactModel("Lactose", false),
    ContactModel("Soy", false),
    ContactModel("Seafood", false),
    ContactModel("Nuts", false),
    ContactModel("Eggs", false),
    ContactModel("Fish", false),
  ];

  List<ContactModel> selectedAllergies = [];
  List<String> allergieslist = [];
  List<String> fallergieslist = [];

  late int i = 0;
  int flag = 1;

  /* @override
  void initState() {
    setState(() {
      int i = 0;
    });
    super.initState();
  } */

  Widget allergiesItem(String name, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          allergies[index].isSelected = !allergies[index].isSelected;
          if (allergies[index].isSelected == true) {
            selectedAllergies.add(ContactModel(name.toString(), true));
            allergieslist.add(name);
            fallergieslist = allergieslist.toSet().toList();
          }
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.top * 0.8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$name",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top * 1.3),
          child: Align(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.blue[400],
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  'Add Allergies',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: 3,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).padding.top * 0.8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Medications",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          color: Colors.blue[400],
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).padding.top * 0.8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Suggestions",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        ListView.builder(
            itemCount: allergies.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return allergiesItem(
                allergies[index].name,
                allergies[index].isSelected,
                index,
              );
            }),
/////////////////////

        fallergieslist == 0
            ? Container()
            : ListView.builder(
                itemCount: fallergieslist.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Text(fallergieslist[index]);
                }),

////////////////////

        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).padding.top * 0.5,
              right: MediaQuery.of(context).padding.top * 0.0,
              /*  top: MediaQuery.of(context).padding.top * 0.3,
                bottom: MediaQuery.of(context).padding.top * 0.3 */
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Lactose',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  iconSize: 22,
                  onPressed: () {},
                  icon: Icon(Icons.cancel),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),

      /*   fallergieslist.length == 0
            ? Container(
                child: Text("Hello"),
              )
            : Tags(
                itemCount: fallergieslist.length,
                itemBuilder: (int index) {
                  return Tooltip(
                      message: fallergieslist[index],
                      child: ItemTags(
                        title: "hello",
                        index: index + 1,
                      ));
                },
              ), */

/////////////////////
        fallergieslist.length == 0
            ? Container()
            : ListView.builder(
                itemCount: fallergieslist.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.top * 0.8,
                          right: MediaQuery.of(context).padding.top * 0.8),
                      child: Text(
                        'notpdoednotupdoaded not updoaded notupdoaded notupdoaded not updoadednot updoaded',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        ),
                      ));
                }),

////////////////////
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).padding.top * 0.8,
                right: MediaQuery.of(context).padding.top * 0.8),
            child: Text(
              'notpdoednotupdoaded not updoaded notupdoaded notupdoaded not updoadednot updoaded',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
              ),
            )),
      ])),
    ));
  }
}

class ContactModel {
  String name;
  bool isSelected;

  ContactModel(this.name, this.isSelected);
}
