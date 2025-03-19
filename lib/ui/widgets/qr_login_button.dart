
import 'package:flutter/material.dart';
// import 'package:native_qr/native_qr.dart';

class QrLoginButton extends StatelessWidget {
  const QrLoginButton({super.key, required this.onResult});

  final Function({required String host, required String token}) onResult;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: CircleBorder(),
      ),
      onPressed: () async {
        try {
          // var nativeQr = NativeQr();
          // String? payload = await nativeQr.get();
          // if (payload != null) {
          //   Codec<String, String> stringToBase64 = utf8.fuse(base64);
          //   var decodedPayload = stringToBase64.decode(payload);
          //   var payloadJson = jsonDecode(decodedPayload);
          //   onResult(
          //     host: payloadJson['host'],
          //     token: payloadJson['token'],
          //   );
          // }
        } catch (err) {
          print(err);
        }
      },
      child: Icon(Icons.qr_code, size: 32),
    );
  }
}
