
import 'package:ocw_app/models/user/user.dart';

class SetUser {
  User user;

  SetUser({this.user});
}

class SetUserComplete {
  User user;

  SetUserComplete({this.user});
}

class FetchUser {}

class FetchUserComplete {}

class UpdateUser {
  User user;

  UpdateUser(this.user);
}

class UpdateUserComplete {
  User user;

  UpdateUserComplete(this.user);
}

class Logging {
  String id;
  String password;

  Logging(this.id, this.password);
}

class OnRefreshWallet {}

class OnRefreshWalletComplete {}

class Logout {}

class ForgetPassword {
  String otp;

  ForgetPassword(this.otp);
}
