import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:share_file_iai/screen/AccountSettings/accout_setting_page.dart';
import 'package:share_file_iai/screen/category_folders/category_folders_page.dart';
import 'package:share_file_iai/screen/share_page/share_page.dart';
import 'package:share_file_iai/widget/root_app_json.dart';
import 'package:svg_flutter/svg.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: getBody(user!.uid, "HU"),
      bottomNavigationBar: getTabs(),
    );
  }

  Widget getBody(String userId, String name) {
    return IndexedStack(
      index: pageIndex,
      children: [
        Body(
          name: name,
        ),
        CategoryFoldersPage(),
        // FolderListPage(),
        SharedFoldersPage(currentUserId: userId),
        AccountSettingsPage()
      ],
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: SvgPicture.asset(
                rootAppJson[index]['icon'],
                color: rootAppJson[index]['color'],
              ),
              title: Text(rootAppJson[index]['text']));
        }));
  }
}
