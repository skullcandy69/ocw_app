import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/post/post_state.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_state.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_state.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;

  UserState get user;

  bool get isRefreshing;

  PostState get post;

  PriceTagState get priceTag;

  TransactionState get transaction;

  RequestState get request;

  @memoized
  List<Post> get all {
    return post.posts.values.where((b) => b.userId != user.profile.id).toList();
  }

//  @memoized
//  bool get isViewed {}

  @memoized
  List<Transaction> get getAllTransaction {
    return transaction.transactions.values.toList();
  }

  @memoized
  List<Request> get getAllRequest {
    return request.requests.values
        .where((b) => b.userName != user.profile.fullName)
        .toList();
  }

  @memoized
  List<Post> get my {
    if (user.profile != null) {
      return post.posts.values
          .toList()
          .where((Post p) => p.userId == user.profile.id)
          .toList();
    } else {
      return [];
    }
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;

  factory AppState() {
    return _$AppState((b) => b
      ..isLoading = false
      ..user = UserState().toBuilder()
      ..post = PostState().toBuilder()
      ..priceTag = PriceTagState().toBuilder()
      ..isRefreshing = false
      ..transaction = TransactionState().toBuilder()
      ..request = RequestState().toBuilder());
  }

  AppState._();
}

abstract class UserState implements Built<UserState, UserStateBuilder> {
  @nullable
  bool get isLoggedIn;

  @nullable
  bool get isLoggingIn;

  @nullable
  User get profile;

  @nullable
  BuiltMap<String, String> get userDetails;

  static Serializer<UserState> get serializer => _$userStateSerializer;

  factory UserState() {
    return _$UserState((b) => b
      ..isLoggedIn = false
      ..isLoggingIn = false);
  }

  UserState._();
}

abstract class PriceTagState
    implements Built<PriceTagState, PriceTagStateBuilder> {
  @nullable
  BuiltMap<VehicleType, PriceTag> get priceTags;

  static Serializer<PriceTagState> get serializer => _$priceTagStateSerializer;

  factory PriceTagState() {
    return _$PriceTagState(
        (b) => b..priceTags = BuiltMap<VehicleType, PriceTag>().toBuilder());
  }

  PriceTagState._();
}
