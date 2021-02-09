import 'dart:async';

import 'package:Vendor_app/src/blocs/auth_bloc.dart';
import 'package:Vendor_app/src/styles/tabbar.dart';
import 'package:Vendor_app/src/widgets/navbar.dart';
import 'package:Vendor_app/src/widgets/orders.dart';
import 'package:Vendor_app/src/widgets/products.dart';
import 'package:Vendor_app/src/widgets/profile.dart';
import 'package:Vendor_app/src/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Vendor extends StatefulWidget {
  StreamSubscription _userSubscription;

  @override
  _VendorState createState() => _VendorState();

  static TabBar get vendorTabBar {
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.article_rounded)),
        Tab(icon: Icon(Icons.local_mall_rounded)),
        Tab(icon: Icon(Icons.person_rounded)),
      ],
    );
  }
}

class _VendorState extends State<Vendor> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var authBloc = Provider.of<AuthBloc>(context, listen: false);
      widget._userSubscription = authBloc.user.listen((user) {
        if (user == null)
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    widget._userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppNavbar.cupertinoNavBar(title: 'Vendor Name', context: context),
            ];
          },
          body: VendorScaffold.cupertinoTabScaffold,
        ),
      );
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    AppNavbar.materialNavBar(
                        title: 'Vendor Name', tabBar: Vendor.vendorTabBar)
                  ];
                },
                body: TabBarView(
                  children: <Widget>[
                    Products(),
                    Orders(),
                    Profile(),
                  ],
                ))),
      );
    }
  }
}
