class ExerciseModel {
  String id;
  String name;
  String howToMake;
  String trainer;
  String? imageUrl;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.howToMake,
    required this.trainer,
    this.imageUrl,
  });

  ExerciseModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        howToMake = map["howToMake"],
        trainer = map["trainer"],
        imageUrl = map["imageUrl"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "howToMake": howToMake,
      "trainer": trainer,
      "imageUrl": imageUrl,
    };
  }
}
