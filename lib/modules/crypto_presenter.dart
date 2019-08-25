import 'package:cryptocurrency_app/data/crypto_data.dart';

import '../dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  CryptoRepository _repository;

  CryptoListPresenter(this._view){
    _repository = Injector().cryptoRepository;
  }

  void loadCurrencies() {
    _repository
      .fetchCurrencies()
      .then((currencies) => _view.onLoadCryptoComplete(currencies))
      .catchError((onError) => _view.onLoadCryptoError());
  }
}