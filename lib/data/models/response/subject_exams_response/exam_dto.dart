import 'package:online_exam_elevate/domain/entities/exam.dart';

class ExamDto {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  DateTime? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) => ExamDto(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        duration: json['duration'] as int?,
        subject: json['subject'] as String?,
        numberOfQuestions: json['numberOfQuestions'] as int?,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'duration': duration,
        'subject': subject,
        'numberOfQuestions': numberOfQuestions,
        'active': active,
        'createdAt': createdAt?.toIso8601String(),
      };

  Exam toExam() {
    return Exam(
      id: id,
      title: title,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      duration: duration,
      active: active,
    );
  }
}
