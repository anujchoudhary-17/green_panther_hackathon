import 'package:green_panther/models/item_model.dart';
import 'package:green_panther/models/user_model.dart';
import 'package:green_panther/sessions/item_session.dart';
import 'package:green_panther/sessions/userSession.dart';


class AddItemController {
  ItemSession itemSession = new ItemSession();

  UserSession userSession = new UserSession();
  void writeItemData(String itemName,String userId,String segregationType) {
    Item itemData = new Item(userId,itemName,segregationType);
    itemSession.pushNewItem(itemData);
    userSession.pushUpdateUser(userId);
  }


}
