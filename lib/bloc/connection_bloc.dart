import 'package:bloc/bloc.dart';

import 'connection_event.dart';
import 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectState> {
  @override
  ConnectState get initialState => ConnectState.connectionLoading;

  @override
  Stream<ConnectState> mapEventToState(ConnectionEvent event) async* {
    switch (event) {
      case ConnectionEvent.requestFailed:
        yield ConnectState.disconnected;
        break;
      case ConnectionEvent.reconnect:
        yield ConnectState.connected;
        break;
      case ConnectionEvent.appStarted:
        yield ConnectState.disconnected;
        break;
    }
  }
}
