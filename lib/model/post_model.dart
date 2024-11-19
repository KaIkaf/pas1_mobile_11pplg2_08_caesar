class PostModel {
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strTeamShort;
  final String strLocation;
  final String strDescriptionEN;

  PostModel({
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strTeamShort,
    required this.strLocation,
    required this.strDescriptionEN
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        strStadium: json['strStadium'],
        strTeam: json['strTeam'],
        strBadge: json['strBadge'],
        strTeamShort: json['strTeamShort'],
        strLocation: json['strLocation'],
        strDescriptionEN: json['strDescriptionEN']
    );
  }
}