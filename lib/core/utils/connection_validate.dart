import 'dart:io';

bool connected = true;

setConnected(bool isConnected) => connected = isConnected;

Future<bool> verifyConexao() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setConnected(true);
      return true;
    }
  } on SocketException catch (_) {
    setConnected(false);
    return false;
  }
  return false;
}
