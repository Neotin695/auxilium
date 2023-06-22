import 'package:flutter/Material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        launchUrl(Uri.parse('tel://123'));
      },
      backgroundColor: Colors.red,
      child:const Icon(Icons.emergency),
    );
  }
}
