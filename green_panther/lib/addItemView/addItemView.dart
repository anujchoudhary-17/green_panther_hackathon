import 'package:enhanced_drop_down/enhanced_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_panther/addItemView/addItemController.dart';
import 'package:green_panther/registerView/registerController.dart';
import 'package:green_panther/utils/NavigationHelper.dart';

import 'package:green_panther/main.dart';
import 'package:green_panther/singleton.dart' as singleton;


class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  AddItemController _controller = AddItemController();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }



  final TextEditingController itemNameController = TextEditingController();
  late String  segregationType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Container(
            height:MediaQuery.of(context).size.height *1,
            color: Colors.blue[500],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Please enter Item info",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 28)
                  ),

                  SizedBox(height: 30),


                  _buildTextField(itemNameController,'Item Name'),

                  SizedBox(height: 20),

                  EnhancedDropDown.withData(
                      dropdownLabelTitle: "Segregation Type",
                      dataSource: ["Recycle", "Organic","Garbage"],
                      defaultOptionText: "Choose",
                      valueReturned: (chosen) {
                        segregationType=chosen;
                        print(chosen);
                      }),
                  SizedBox(height: 30),


                  MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () async {
                        _controller.writeItemData(singleton.currentUser!.uid,segregationType,itemNameController.text.trim());

                        NavigationHelper().navigateToHome(context);
                      },

                      color: Colors.blue,

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "Add Item",
                                style: TextStyle(color: Colors.white, fontSize: 20)
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ]
                      )

                  ),

                  SizedBox(height: 20),



                ]
            ),
          ),
        )
    );


  }



  _buildTextField(
      TextEditingController controller, String labelText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
          0.025,),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color:  Colors.blue[200], border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }



}
