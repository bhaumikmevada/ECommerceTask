
enum ConnectionType{
  wifi,
  mobile
}

abstract class InternetState{
}

class InternetLoading extends InternetState{}
class InternetConnected extends InternetState{
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisConnected extends InternetState{}