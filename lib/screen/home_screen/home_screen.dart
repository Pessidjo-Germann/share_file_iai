import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:share_file_iai/screen/AccountSettings/accout_setting_page.dart';
import 'package:share_file_iai/screen/liste_document/list_doc.dart';
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
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getTabs(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Body(),
        FolderListPage(),
        Center(
          child: Text(
            "Trash Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
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
