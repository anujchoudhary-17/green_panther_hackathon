
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavigationHelper.dart';

Widget DrawerWidget(BuildContext context)
{
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("Green Panther",style: TextStyle(color: Colors.white,fontSize: 30),),
        ),
        ListTile(
          title: Text('Dashboard',style: TextStyle(fontSize: 20),),
          onTap: () {
            NavigationHelper().navigateToHome(context);
          },
        ),
        ListTile(
          title: Text('Add Item',style: TextStyle(fontSize: 20),),
          onTap: () {
            NavigationHelper().navigateToAddItem(context);
          },
        ),
        ListTile(
          title: Text('Blog Posts',style: TextStyle(fontSize: 20),),
          onTap: () {
            NavigationHelper().navigateToBlogPosts(context);
          },
        ),
        ListTile(
          title: Text('Camera View',style: TextStyle(fontSize: 20),),
          onTap: () {
            NavigationHelper().navigateToCameraView(context);
          },
        ),
      ],
    ),
  );
}