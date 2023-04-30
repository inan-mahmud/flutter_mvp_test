import 'package:base_view_model_app/number_update_interface.dart';

class HomePresenter {
  final NumberUpdateInterface _numberUpdateInterface;

  HomePresenter(this._numberUpdateInterface);

  void changeNumber(int number) {
    _numberUpdateInterface.onUpdateNumber(number);
  }
}
