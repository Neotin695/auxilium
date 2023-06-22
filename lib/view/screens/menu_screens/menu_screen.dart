import 'package:auxilium2/config/preferences_helper.dart';
import 'package:auxilium2/model/user_model.dart';
import 'package:auxilium2/view/screens/menu_screens/settings_screen.dart';
import 'package:flutter/Material.dart';

import 'about_us_screen.dart';
import 'emergency_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    user = PreferencesHelper.instance.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 330,
            width: double.infinity,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.indigoAccent,
                  Colors.indigo,
                ],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    (user?.type ?? -1) == 0
                        ? "https://e7.pngegg.com/pngimages/683/251/png-clipart-disability-disabled-parking-permit-wheelchair-ramp-accessibility-wheelchair-text-trademark-thumbnail.png"
                        : "https://e7.pngegg.com/pngimages/906/448/png-clipart-silhouette-person-person-with-helmut-animals-logo-thumbnail.png",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Hi..${user?.name ?? ''}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  (user?.type ?? -1) == 0 ? 'Patient' : "Adminstrator",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 40),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.indigo,
                    size: 25,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.indigo,fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                ),
                if ((user?.type ?? -1) == 0) ...[
                  ListTile(
                    leading: Icon(
                      Icons.emergency,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      "Emergency",
                      style: TextStyle(color: Colors.indigo,fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyScreen()));
                    },
                  ),
                ],
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.indigo,

                  ),
                  title: Text(
                    "About auxilium",
                    style: TextStyle(color: Colors.indigo   ,fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpScreen()));
                  },
                ),
                ListTile(
                  leading:const Icon(
                    Icons.exit_to_app,
                    color: Colors.indigo,
                  ),
                  title:const Text(
                    "Logout",
                    style: TextStyle(color: Colors.indigo,fontSize: 20),
                  ),
                  onTap: () {
                    PreferencesHelper.instance.logout(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
