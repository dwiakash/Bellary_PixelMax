import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/utilities/message.dart';

extension ResponseExtension on ResponseData {
  bool get hasError {
    int statusCode = this.statusCode;
    if (statusCode == 200 && data["status"] || statusCode == 201) {
      return false;
    }
    // if (statusCode == 401) return true;
    String errMsg = data['message'] ?? '';
    if (errMsg.isNotEmpty) showMessage(errMsg);
    return true;
  }
}
