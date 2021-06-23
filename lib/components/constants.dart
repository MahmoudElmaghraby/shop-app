import 'package:shop_app/components/components.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';

void sighOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}

String token = '';