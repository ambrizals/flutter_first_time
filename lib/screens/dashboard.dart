import 'package:bbd_apps/components/Dashboard/HomeSection/MenuButton.dart';
import 'package:bbd_apps/components/Dashboard/MenuSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _dashboardViewKey = new GlobalKey<ScaffoldState>();
  PageController pageControl = PageController();


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: _dashboardViewKey,
      endDrawer: MenuSection(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Halo, Ambrizal", style: TextStyle(fontSize: 24)),
                        Text("Semoga Pekerjaan Lancar ya !"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    IconButton(
                      icon: Icon(FontAwesome5Solid.bars),
                      onPressed: () {
                        _dashboardViewKey.currentState.openEndDrawer();
                      },
                      splashRadius: 24,
                    )
                  ],
                ),
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Pilihan Menu", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      Divider(height: 1, thickness: 0.5),
                      Container(
                        width: double.infinity,
                        height: 90,
                        child: GridView.count(
                          crossAxisCount: 4,
                          primary: false,
                          children: [
                            MenuButtonHome(
                              title: Text("Produk"),
                              icon: Icon(FontAwesome5Solid.book),
                              action: () {},
                            ),
                            MenuButtonHome(
                              title: Text("Material"),
                              icon: Icon(FontAwesome5Solid.toolbox),
                              action: () {},
                            ),
                            MenuButtonHome(
                              title: Text("Pengiriman"),
                              icon: Icon(FontAwesome5Solid.paper_plane),
                              action: () {},
                            ),
                            MenuButtonHome(
                                title: Text("Laporan"),
                                icon: Icon(FontAwesome5Solid.history),
                                action: () {})
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}