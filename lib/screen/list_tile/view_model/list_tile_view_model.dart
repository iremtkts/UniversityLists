import 'package:university_lists/core/service/model/university_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileViewModel {
  Future<void> onUniversityTap(University? university) async {
    final url = university?.webPages.first;
    if (url != null) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }
}
