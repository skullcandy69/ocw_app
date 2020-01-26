import 'package:url_launcher/url_launcher.dart';

class Call {
  void call(String number) => launch("tel: $number");
  void sendEmail(String email) => launch("mailto:$email");
  void sendSms(String number) => launch("sms:$number");
}
