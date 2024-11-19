

class ModelPremier {
  final int? id;
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strTeamShort;
  final String strLocation;
  final String strDescriptionEN;
  final bool isCompleted;
  ModelPremier({
    this.id,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strTeamShort,
    required this.strLocation,
    required this.strDescriptionEN,
    this.isCompleted = false,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'strTeam': strTeam,
      'strStadium': strStadium,
      'strBadge': strBadge,
      'strTeamShort': strTeamShort,
      'strLocation': strLocation,
      'strDescriptionEN': strDescriptionEN,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
  factory ModelPremier.fromMap(Map<String, dynamic> map) {
    return ModelPremier(
      id: map['id'] as int?,
      strTeam: map['strTeam'] as String,
      strStadium: map['strStadium'] as String,
      strBadge: map['strBadge'] as String,
      strTeamShort: map['strTeamShort'] as String,
      strLocation: map['strLocation'] as String,
      strDescriptionEN: map['strDescriptionEN'] as String,
      isCompleted: map['isCompleted'] == 1, 
    );
  }
}