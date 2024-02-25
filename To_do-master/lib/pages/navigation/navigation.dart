import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/app_image.dart';
import 'package:todo_app/pages/dashboard/dashboard.dart';
import 'package:todo_app/pages/homepage/homepage.dart';
import 'package:todo_app/pages/settings/settings.dart';
import 'package:todo_app/pages/timetable/time_table.dart';

class Navigation extends StatefulWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _navigationIndex = 0;
  PageController _pagecontroller = PageController();
  setNavigationIndex(int index) {
    setState(() {
      _navigationIndex = index;
    });
  }

  itemTapped(int index) {
    setState(() {
      _navigationIndex = index;
      _pagecontroller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_navigationIndex == 0) {
          showBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              backgroundColor: Colors.white,
              builder: (context) {
                return Container(
                  constraints: const BoxConstraints(maxHeight: 600),
                  child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Do you want to quit the application?",
                                style: TextStyle(color: Colors.black)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              primary),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                    child: const Text(
                                      "Quit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              });
        } else {
          itemTapped(0);
        }

        return Future.value(false);
      },
      child: Scaffold(
        body: PageView(
          onPageChanged: setNavigationIndex,
          controller: _pagecontroller,
          // physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            Dashboard(),
            TimeTable(),
            Settings(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          height: 80,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomMenu(
                    onTap: () => itemTapped(0),
                    color: _navigationIndex == 0 ? Colors.black : Colors.grey,
                    icon: dashboard,
                  ),
                  CustomMenu(
                    onTap: () => itemTapped(1),
                    color: _navigationIndex == 1 ? Colors.black : Colors.grey,
                    icon: pie,
                  ),
                  CustomMenu(
                    onTap: () => itemTapped(2),
                    color: _navigationIndex == 2 ? Colors.black : Colors.grey,
                    icon: events,
                  ),
                  CustomMenu(
                    onTap: () => itemTapped(3),
                    color: _navigationIndex == 3 ? Colors.black : Colors.grey,
                    icon: settings,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMenu extends StatelessWidget {
  void Function()? onTap;
  String? icon;
  Color? color;

  CustomMenu({super.key, this.onTap, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(
          icon ?? "",
          height: 30,
          width: 30,
          color: color,
        ));
  }
}
