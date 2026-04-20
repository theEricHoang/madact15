class Question {
  final String question;
  final String correctAnswer;
  final List<String> answers;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final correctAnswer = json['correct_answer'] as String;
    final incorrectAnswers =
        List<String>.from(json['incorrect_answers'] as List);
    final answers = [...incorrectAnswers, correctAnswer]..shuffle();

    return Question(
      question: json['question'] as String,
      correctAnswer: correctAnswer,
      answers: answers,
    );
  }
}
