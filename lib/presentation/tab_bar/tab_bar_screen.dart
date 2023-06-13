import 'package:flutter/material.dart';
import 'package:medical_consultation_app/presentation/add/add_screen.dart';
import 'package:medical_consultation_app/presentation/add/widgets/add_button.dart';
import 'package:medical_consultation_app/presentation/documents/documents_screen.dart';
import 'package:medical_consultation_app/presentation/home/home_screen.dart';
import 'package:medical_consultation_app/presentation/messaging/messaging_screen.dart';
import 'package:medical_consultation_app/presentation/settings/settings_screen.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const DocumentsScreen(),
    const AddScreen(),
    const MessagingScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.lighterGrey3,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyles.semiBold(fontSize: 0),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.contact_page_sharp),
          ),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.message)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.settings)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
      floatingActionButton: AddButton(onTap: _onItemTapped),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
