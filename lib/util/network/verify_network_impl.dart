import 'package:arquitectura/util/network/verify_network.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class VerifyNetworkImpl implements VerifyNetwork {
  final DataConnectionChecker _dataConnectionChecker;


  VerifyNetworkImpl(this._dataConnectionChecker);

  @override
  Future<bool> isConnected() {
    return _dataConnectionChecker.hasConnection;
  }
}
