import 'package:get/get.dart';
import 'package:scholr/features/auth/views/login_view.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginView());
  }
}
