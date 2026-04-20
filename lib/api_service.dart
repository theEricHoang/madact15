import 'dart:convert';
import 'package:http/http.dart' as http;
import 'question.dart';

class ApiService {
  static const _baseUrl = 'https://opentdb.com/api.php';

  Future<List<Question>> fetchQuestions() async {
    final url = Uri.parse(
      '$_baseUrl?amount=10&category=9&difficulty=easy&type=multiple',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load questions: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['results'] as List;

    return results
        .map((json) => Question.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
