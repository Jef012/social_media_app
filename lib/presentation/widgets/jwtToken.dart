import 'dart:convert';

/// Function to decode Base64Url-encoded string
String base64UrlDecode(String input) {
  String output = input.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!');
  }

  return utf8.decode(base64.decode(output));
}

/// Function to decode JWT token and get the payload data
Map<String, dynamic> decodeJWT(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT token');
    }

    final payload = base64UrlDecode(parts[1]);
    final payloadMap = json.decode(payload);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  } catch (e) {
    print('Error decoding JWT: $e');
    return {};
  }
}
