import 'package:http/http.dart' as http;
import '../../../core/constants/app_constants.dart';
import '../../models/response/api_response.dart';

class NetworkManager {
  final String baseUrl;
  final http.Client _client;

  NetworkManager({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _client
          .get(
            Uri.parse('$baseUrl$endpoint'),
            headers: headers,
          )
          .timeout(const Duration(seconds: AppConstants.apiTimeoutDuration));

      if (response.statusCode == 200) {
        return ApiResponse.success(response.body as T);
      } else {
        return ApiResponse.error('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final response = await _client
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: AppConstants.apiTimeoutDuration));

      if (response.statusCode == 200) {
        return ApiResponse.success(response.body as T);
      } else {
        return ApiResponse.error('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  void dispose() {
    _client.close();
  }
} 