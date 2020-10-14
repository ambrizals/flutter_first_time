import './connector.dart';
import '../models/settings.dart';

class RepositoryServiceSettings {
  static Future<List<Settings>> getAllSettings() async {
    final sql = "select * from settings";
    final data = await db.rawQuery(sql);
    List<Settings> settings = List();

    for (final node in data) {
      final setting = Settings.fromJson(node);
      settings.add(setting);
    }

    return settings;
  }
}