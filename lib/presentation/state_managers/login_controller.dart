import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/auth_utility.dart';
import 'package:taskmanager_ostad/data/models/login_model.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

class SignInController extends GetxController{
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailTEController = TextEditingController();
  // final TextEditingController _passwordTEController = TextEditingController();

  bool _signInProgress = false;
  bool get signInProgress => _signInProgress;

  Future<bool> logIn(String email, String password) async {
    _signInProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.login, requestBody, isLogin: true);
    _signInProgress = false;
    update();

    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
      return true;
    }else{
      return false;
    }
  }
}