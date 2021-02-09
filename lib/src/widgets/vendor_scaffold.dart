import 'package:Vendor_app/src/styles/colors.dart';
import 'package:Vendor_app/src/widgets/orders.dart';
import 'package:Vendor_app/src/widgets/products.dart';
import 'package:Vendor_app/src/widgets/profile.dart';
import 'package:flutter/cupertino.dart';

abstract class VendorScaffold {
  static CupertinoTabScaffold get cupertinoTabScaffold {
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar,
      tabBuilder: (context, index) {
        return _pageSelection(index);
      },
    );
  }

  static get _cupertinoTabBar {
    return CupertinoTabBar(
      backgroundColor: AppColors.darkblue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.today_fill), title: Text('Products')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.personalhotspot), title: Text('Orders')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_rectangle),
            title: Text('Profile')),
      ],
    );
  }

  static Widget _pageSelection(int index) {
    if (index == 0) {
      return Products();
    }

    if (index == 1) {
      return Orders();
    }

    return Profile();
  }
}
