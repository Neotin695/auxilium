import 'package:auxilium2/config/preferences_helper.dart';
import 'package:auxilium2/view/screens/admin_screens/admin_home_screen.dart';
import 'package:auxilium2/view/screens/patient_screens/patient_home_screen.dart';
import 'package:flutter/Material.dart';

import '../../controller/loc_services.dart';
import '../../model/user_model.dart';
import '../widgets/emergency_widget.dart';
import 'chat_screen.dart';
import 'menu_screens/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [];
  List<BottomNavigationBarItem> bottomItems = [];

  UserModel? user;

  bool hideButton = false;

  @override
  void initState() {
    super.initState();
    LocSerivces().fetchCurrentLocation(PreferencesHelper.instance.getUser()!);
    user = PreferencesHelper.instance.getUser();

    if (user != null) {
      if (user?.type == 0) {
        screens = const [
          PatientHomeScreen(),
          ChatScreen(),
          MenuScreen(),
        ];
        bottomItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ];
      } else {
        screens = const [
          AdminHome(),
          ChatScreen(),
          MenuScreen(),
        ];
        bottomItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54.withOpacity(0.9),
      floatingActionButton: user?.type == 1
          ? null
          : hideButton
              ? null
              : const EmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.indigo.withOpacity(0.9),
        unselectedItemColor: Colors.indigoAccent[100]!.withOpacity(0.8),
        currentIndex: (selectedIndex),
        onTap: (index) {
          setState(() {
            if ((index == 1 && user?.type == 0) ||
                (index == 1 && user?.type == 1)) {
              hideButton = true;
            } else {
              hideButton = false;
            }
            selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
    );
  }
}
