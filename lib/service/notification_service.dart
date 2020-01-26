
import 'package:ocw_app/app_config.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  static final NotificationService _notificationUtils =
      new NotificationService._();

  factory NotificationService.getInstance() => _notificationUtils;

  NotificationService._();

  initNotification() {
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      final data = notification.payload.additionalData;
      print('data $data');
      if (data["type"] != null) {
        print('one signal ${data["data"]}');
        switch (["type"]) {
        }
      }
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('being opened');
    });
  }
}

sendNotification() async {
  var status = await OneSignal.shared.getPermissionSubscriptionState();

  var playerId = status.subscriptionStatus.userId;
  await OneSignal.shared.postNotification(OSCreateNotification(
      playerIds: [playerId],
      content: "You have some booking",
      heading: "Test Notification",
      buttons: [
        OSActionButton(text: "test1", id: "id1"),
        OSActionButton(text: "test2", id: "id2")
      ]));
}

initOneSignal() {
  OneSignal.shared.init(AppConfig.oneSignalAppId);
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  notificationService.initNotification();
}

addOneSignalUser(User user) {
  OneSignal.shared.sendTag("user_id", user.id);
}
