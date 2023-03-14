import 'package:json_annotation/json_annotation.dart';

part 'onboardingitem.g.dart';

@JsonSerializable()
class Onboardingitem {
  String title;
  String text;
  String imageName;
  Onboardingitem({
    required this.title,
    required this.text,
    required this.imageName,
  });

  Onboardingitem copyWith({
    String? title,
    String? text,
    String? imageName,
  }) {
    return Onboardingitem(
      title: title ?? this.title,
      text: text ?? this.text,
      imageName: imageName ?? this.imageName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'text': text});
    result.addAll({'imageName': imageName});

    return result;
  }

  factory Onboardingitem.fromMap(Map<String, dynamic> map) {
    return Onboardingitem(
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      imageName: map['imageName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$OnboardingitemToJson(this);

  factory Onboardingitem.fromJson(Map<String, dynamic> source) =>
      _$OnboardingitemFromJson(source);

  @override
  String toString() =>
      'Onboardingitem(title: $title, text: $text, imageName: $imageName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Onboardingitem &&
        other.title == title &&
        other.text == text &&
        other.imageName == imageName;
  }

  @override
  int get hashCode => title.hashCode ^ text.hashCode ^ imageName.hashCode;
}
