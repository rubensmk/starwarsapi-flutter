class People {
  String name;
  String gender;
  int height;
  int mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String bdayYear;

  People(this.name, this.gender, this.height, this.mass, this.hairColor,
      this.skinColor, this.eyeColor, this.bdayYear);

  People.fromJson(Map<String, dynamic> json) {
    name = json['results'][0]['name'];
  }
}
