import 'exam_dto.dart';
import 'metadata.dart';

class SubjectExamsResponse {
  String? message;
  Metadata? metadata;
  List<ExamDto>? exams;

  SubjectExamsResponse({this.message, this.metadata, this.exams});

  factory SubjectExamsResponse.fromJson(Map<String, dynamic> json) {
    return SubjectExamsResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'exams': exams?.map((e) => e.toJson()).toList(),
      };
}
