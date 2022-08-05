class BandModel {
  final String id;
  final String name;
  final int votes;

  BandModel({
    required this.id,
    required this.name,
    required this.votes,
  });
  factory BandModel.fromMap(Map<String, dynamic> obj) {
    return BandModel(id: obj['id'], name: obj['name'], votes: obj['votes']);
  }
}
