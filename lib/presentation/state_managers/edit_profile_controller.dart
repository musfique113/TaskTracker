import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/auth_utility.dart';
import 'package:taskmanager_ostad/data/models/login_model.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

class EditProfileController extends GetxController{

  bool _profileInProgress = false;
  bool get profileInProgress => _profileInProgress;

  void getUpdateState() {
    update();
  }

  Future<bool> updateProfile(String firstName, String lastName, String mobile, String password) async {
    _profileInProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": ""
    };
    if (password.isEmpty && password.length>5) {
      requestBody['password'] = password;
    }

    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.updateProfile, requestBody);
    _profileInProgress = false;
    update();
    if (response.isSuccess) {
      UserData userData = AuthUtility.userInfo.data!;
      userData.firstName = firstName;
      userData.lastName = lastName;
      userData.mobile = mobile;
      AuthUtility.updateUserInfo(userData);
      return true;
    } else {
      return false;
    }
  }
}