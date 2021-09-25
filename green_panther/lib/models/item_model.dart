class Item {
  String? itemId;
  String segregationType, itemName,whoAdded;


  Item(this.segregationType, this.whoAdded,this.itemName
      );

  Item.fromJson(Map<String, dynamic> json) :
        itemId = json['itemId'],
        itemName = json['itemName'],
        segregationType = json['segregationType'],
        whoAdded = json['whoAdded'];



  Map<String,dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['whoAdded'] = this.whoAdded;
    data['itemName'] = this.itemName;
    data['segregationType'] = this.segregationType;

    return data;
  }
}
