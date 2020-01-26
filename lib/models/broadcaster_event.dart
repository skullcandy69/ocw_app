import 'package:ocw_app/service/broadcaster_service.dart';

class BroadcasterEvent {
  BroadcasterEventType event;
  Map<String, dynamic> data;

  // ignore: avoid_init_to_null
  BroadcasterEvent({BroadcasterEventType event, Map<String, dynamic> data = null}) {
    this.event = event;
    this.data = data;
  }
}
