export 'user_action.dart';


import 'package:ocw_app/models/vehicle/price_tag.dart';

class LoadingAction {
  bool isLoading;

  LoadingAction(this.isLoading);
}

class CheckSession {}

class ExitSession {}

class SetPriceTag {
  List<PriceTag> priceTag;

  SetPriceTag(this.priceTag);
}
