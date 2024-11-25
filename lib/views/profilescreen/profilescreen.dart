import 'package:flutter/material.dart';
import 'package:news_app/utils/colorconstants.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: ColorConstants.black,
              child: Icon(
                Icons.person,
                color: ColorConstants.grey,
                size: 35,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 5,
            ),
            Text("emailid"),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: ColorConstants.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.grey),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: ColorConstants.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "settings",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.grey),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: ColorConstants.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "logout",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.grey),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
