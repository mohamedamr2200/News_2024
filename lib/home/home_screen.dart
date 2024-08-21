import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../category/category_details.dart';
import '../category/category_fragment.dart';
import '../model/Category.dart';
import '../settings/setting.dart';
import 'home_drawer.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'))),
      child: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('News ',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        drawer: HomeDrawer(onSideItemMenu: onSideItemMenu),
        body: selectedItemDrawer == HomeDrawer.SETTINGS ?
            SettingWidget()
            :
        selectedCategory == null ?
        CategoryFragment
          (onCategoryItemClicked: onCategoryItemClicked):
            CategoryDetails(category: selectedCategory!)
        ,
      ),
    );
  }

  Category? selectedCategory = null ;
  void onCategoryItemClicked(Category category){
    selectedCategory = category ;
    setState(() {

    });
  }

  // category , settings
  var selectedItemDrawer = HomeDrawer.CATEGORIES ;
  void onSideItemMenu(int selectedItem){
    // selected item => user (category / setting)
    selectedItemDrawer = selectedItem ;
    Navigator.pop(context);
    selectedCategory = null ;
    setState(() {

    });
  }
}
