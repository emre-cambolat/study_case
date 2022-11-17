import 'dart:convert';

List<ExerciesModel> exericesModelFromJson(String str) {
  return List<ExerciesModel>.from(
      json.decode(str).map((x) => ExerciesModel.fromJson(x)));
}

String exericesModelToJson(List<ExerciesModel> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class ExerciesModel {
  ExerciesModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  String name;
  Type type;
  Muscle muscle;
  String equipment;
  Difficulty difficulty;
  String instructions;

  factory ExerciesModel.fromJson(Map<String, dynamic> json) {
    return ExerciesModel(
      name: json["name"],
      type: Type.values[Type.values
          .indexWhere((element) => element.name.toLowerCase() == json['type'])],
      muscle: Muscle.values[Muscle.values.indexWhere(
          (element) => element.name.toLowerCase() == json['muscle'])],
      equipment: json["equipment"],
      difficulty: Difficulty.values[Difficulty.values.indexWhere(
          (element) => element.name.toLowerCase() == json['difficulty'])],
      instructions: json["instructions"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type.name,
        "muscle": muscle.name,
        "equipment": equipment,
        "difficulty": difficulty.name,
        "instructions": instructions,
      };
}

enum Difficulty {
  BEGINNER,
  INTERMEDIATE,
  EXPERT,
}

enum Type {
  CARDIO,
  OLYMPIC_WEIGHTLIFTING,
  PLYOMETRICS,
  POWERLIFTING,
  STRENGTH,
  STRETCHING,
  STRONGMAN,
}

enum Muscle {
  ABDOMINALS,
  ABDUCTORS,
  ADDUCTORS,
  BICEPS,
  CALVES,
  CHEST,
  FOREARMS,
  GLUTES,
  HAMSTRINGS,
  LATS,
  LOWER_BACK,
  MIDDLE_BACK,
  NECK,
  QUADRICEPS,
  TRAPS,
  TRICEPS,
  SHOULDERS,
}
