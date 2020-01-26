import 'package:ocw_app/models/broadcaster_event.dart';
import 'package:rxdart/rxdart.dart';

class BroadcasterService {
  BroadcasterService._();

  static final BroadcasterService _instance = new BroadcasterService._();

  factory BroadcasterService.getInstance() => _instance;

  // ignore: close_sinks
  PublishSubject<BroadcasterEvent> _eventBus =
      // ignore: close_sinks
      new PublishSubject<BroadcasterEvent>();

  void broadcast(BroadcasterEvent event) {
    print("event added");
    this._eventBus.add(event);
  }

  Observable<BroadcasterEvent> on(BroadcasterEventType event) {
    print("event on called " + event.toString());
    return (new Observable(this._eventBus.stream)).where((BroadcasterEvent e) {
      return e.event == event;
    });
  }

  Observable<BroadcasterEvent> includes(List<BroadcasterEventType> events) {
    return (new Observable(this._eventBus.stream)).where((BroadcasterEvent e) {
      return events.indexWhere((BroadcasterEventType innerEvent) {
            return innerEvent == e.event;
          }) >=
          0;
    });
  }

  Observable<BroadcasterEvent> excludes(List<BroadcasterEventType> events) {
    return (new Observable(this._eventBus.stream)).where((BroadcasterEvent e) {
      return events.indexWhere((BroadcasterEventType innerEvent) {
            return innerEvent == e.event;
          }) <
          0;
    });
  }
}

// Added Broadcaster events here
enum BroadcasterEventType {
  onBooking,
  onDeletingPost,
  onReportingPost,
  onViewingPost,
  onEditingPost,
  onSendingMoney,
  onRequestingMoney,
  onExitSession,
  onLogin,
  onLogout,
  onError,
  onSignUp,
  onUpdateUser,
  onUpdateUserType,
  onAccepting,
  onRejecting,
  onChange,
}
