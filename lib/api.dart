import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:5000";
const String productPath = "/api/products/";

// Always return a Map, even on error
Future<Map<String, dynamic>> fetchPublishedProducts(
    {int page = 1, int limit = 20}) async {
  final uri = Uri.parse("$baseUrl$productPath?page=$page&limit=$limit");

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // success response
    } else {
      return {
        "success": false,
        "status": response.statusCode,
        "message": "Failed to load products"
      };
    }
  } catch (e) {
    return {
      "success": false,
      "message": "Something went wrong",
      "error": e.toString(),
    };
  }
}
