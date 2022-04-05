import 'package:saleo_app/database/models/user_model.dart';

List<UserModel> usersList = [];

void signUp(UserModel value) {
  usersList.add(value);
  print(value.toString());
}
