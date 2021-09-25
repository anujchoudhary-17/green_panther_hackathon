import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_panther/models/item_model.dart';
import 'package:green_panther/singleton.dart' as singleton;
import 'package:green_panther/utils/NavigationHelper.dart';
import 'package:green_panther/utils/drawer.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  List items = [];
  List filteredItems = [];
  bool isSearching = false;

  TextEditingController _searchController = new TextEditingController();

  Future getAllTags() async {
    List tempItemList = [];

    try {
      await FirebaseFirestore.instance.collection('itemCollection').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tempItemList.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });

      return tempItemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchItems() async {
    dynamic data = await getAllTags();

    if (data == null) {
      print("Unable to get data");
    } else {
      setState(() {
        items = data;
      });
    }
  }


  @override
  void initState() {

    super.initState();
    fetchItems();
    print('Items are $items');
  }


  void filterItems(searchQuery){
    filteredItems=[];
    for(int i=0;i<items.length;i++)
      {
        if((items[i]['itemName']).contains(searchQuery))
        {
          print('${items[i]['itemName']}');
          filteredItems.add(items[i]);
        }
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(context),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('Green Panther')
            : TextField(
          onChanged: (value) {
            setState(() {
              filterItems(value);

            });
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search Item Here",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                filteredItems = items;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredItems.length > 0
            ? ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  itemCard(filteredItems[index]);
                },
                child: Card(
                  elevation: 10,
                  color:filteredItems[index]['segregationType']=='Recycle' ? Colors.blue : filteredItems[index]['segregationType'] == 'Organic' ? Colors.green : Colors.grey ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: Text(
                      filteredItems[index]['itemName'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            })
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),


    );


  }

  
  Widget itemCard(Item item){
    print("Hey I am "+item.itemName);
    return Container(
            child: Text(item.itemName),
      color: Colors.pink,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.green,
      ),
        );

  }

}