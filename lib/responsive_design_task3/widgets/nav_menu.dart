import 'package:flutter/material.dart';

class buildDrawer extends StatelessWidget {
  const buildDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Drawer(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xff1FE590),
                  width: double.maxFinite,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Responsive",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      Text(
                        "Design",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                )),
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.expand),
                      title: Text("Episodes",
                          style: TextStyle(color: Colors.black)),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title:
                      Text("About", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
