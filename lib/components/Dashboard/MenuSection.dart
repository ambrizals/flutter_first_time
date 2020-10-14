import 'package:bbd_apps/components/Dashboard/MenuSection/ProfileBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MenuSection extends StatefulWidget {
  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      color: Colors.white,
      child: ListView(
        children: [
          ProfileBox(),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            title: Text("Master Data"),
            dense: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.book),
            title: Text('Produk'),
            subtitle: Text('Katalog produk - produk yang tersedia'),
            onTap: (){},
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.toolbox),
            title: Text("Material"),
            subtitle: Text('Katalog material yang pernah digunakan'),
            onTap: (){},
            isThreeLine: true,
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            title: Text("Manajemen"),
            dense: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.shopping_cart),
            title: Text("Transaksi"),
            subtitle: Text("Modul untuk transaksi penjualan"),
            onTap: (){},
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.tasks),
            title: Text("Tugas"),
            subtitle: Text("Daftar Tugas Yang Sedang Diproses"),
            onTap: (){},
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.tasks),
            title: Text("Pekerjaan"),
            subtitle: Text("Daftar Pekerjaan Yang Sedang Diproses"),
            onTap: (){},
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.paper_plane),
            title: Text("Pengiriman"),
            subtitle: Text("Daftar Pengiriman Pada Pekerjaan Yang Telah Diselesaikan"),
            onTap: (){},
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(FontAwesome5Solid.history),
            title: Text("Laporan"),
            subtitle: Text("Laporan Penjualan dan Laporan Pengeluaran"),
            onTap: (){},
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
