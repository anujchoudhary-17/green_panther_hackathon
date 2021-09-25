import 'package:green_panther/models/user_model.dart';
import 'package:green_panther/sessions/userSession.dart';


class RegisterController {
  UserSession userSession = new UserSession();


  void writeUserData(String email,String userId) {
    User userData =
    new User(email: email,userId: userId, totalPoints: 0);
    userSession.pushNewUser(userData);
  }

  Future getUserData(String userId) {
    return userSession.getUser(userId);
  }

}
