class Settings {
  int id;
  String name, value;

  Settings(this.id, this.name, this.value);

  Settings.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.value = json['value'];
  }
}
