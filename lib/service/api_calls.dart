import 'package:http/http.dart' as http;
import 'package:inter_smart_machine_test/models/model.dart';
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'https://crm.intersmarthosting.in/cred/api/v1/';
  final String _endpoint = 'api/mock-forex/data';
  final String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcyLCJpYXQiOjE3MTgwMjQzMTQsImV4cCI6MTcxODExMDcxNH0.SlixI5JpIxYNtGOVh5cB7rkqG_gWlqQm7CxDGnmhTTw';

  Future<PaymentResponse> fetchData() async {
    final url = Uri.parse('$_baseUrl$_endpoint');
    final headers = {
      'Authorization': '$_token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return PaymentResponse.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
