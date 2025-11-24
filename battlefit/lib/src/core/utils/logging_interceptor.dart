import 'package:flutter/foundation.dart';

class LoggingInterceptor {
  void logRequest(String url, {Map<String, dynamic>? params}) {
    if (kDebugMode) {
      print('🌐 Request: $url');
      if (params != null) {
        print('   Params: $params');
      }
    }
  }

  void logResponse(String url, {dynamic data}) {
    if (kDebugMode) {
      print('✅ Response: $url');
      if (data != null) {
        print('   Data: $data');
      }
    }
  }

  void logError(String url, {dynamic error}) {
    if (kDebugMode) {
      print('❌ Error: $url');
      if (error != null) {
        print('   Error: $error');
      }
    }
  }
}
