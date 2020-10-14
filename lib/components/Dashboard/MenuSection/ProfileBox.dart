// import 'package:bbd_apps/components/Dashboard/MenuSection/LogoutButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfileBox extends StatefulWidget {
  @override
  _ProfileBoxState createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: CachedNetworkImage(
                imageUrl: "https://cbs.ambrizal.net/assets/img/me.jpeg",
                imageBuilder: (context, imageProvider) => Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // placeholder: (context, url) => placeholder,
                // errorWidget: (context, url, error) => errorWidget,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text("Ambrizal Suryadinata"),
                  Text("Kantor"),
                  RaisedButton.icon(
                    icon: Icon(FontAwesome5Solid.cogs, size: 16),
                    label: Text("Pengaturan"),
                    elevation: 0,
                    onPressed: () {},
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
