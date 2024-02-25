import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/app_image.dart';
import 'package:todo_app/constants/data.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/constants/styles.dart';
import 'package:todo_app/pages/calendart/calendar.dart';
import 'package:todo_app/widgets/custom_tabs.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/single_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String? _startDate, _endDate;
  PageController controller = PageController();
  TextStyle style = GoogleFonts.inter(
      color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700);
  TextStyle style2 = GoogleFonts.inter(
      color: primary, fontSize: 17, fontWeight: FontWeight.w700);

  @override
  void initState() {
    // TODO: implement initState
    final DateTime today = DateTime.now();
    _startDate = DateFormat('MMM dd yyyy').format(today).toString();
    _endDate = DateFormat('MMM dd yyyy')
        .format(today.add(const Duration(days: 3)))
        .toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: ListTile(
          minVerticalPadding: 0,
          leading: Image.asset(avatar),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SR Khan", style: basicStyle.copyWith(fontSize: 18)),
              Text(
                "39 tasks today",
                style: basicGrey,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              iconNotification,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Wrap(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Expanded(flex: 2, child: SizedBox()),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "Create Task",
                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(Icons.clear)))
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Name",
                                  style: style,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  hint: "name",
                                  prefix: const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: SizedBox()),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Calendar",
                                  style: style,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CalendarWidget(
                                                      endDate: (value) {
                                                        setState(() {
                                                          _endDate = value;
                                                        });
                                                      },
                                                      startDate: (startDate) {
                                                        setState(() {
                                                          _startDate =
                                                              startDate;
                                                        });
                                                      },
                                                    )));
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            start,
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            _startDate ?? "Select Date",
                                            style: style,
                                          )
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CalendarWidget(
                                                      endDate: (value) {
                                                        setState(() {
                                                          _endDate = value;
                                                        });
                                                      },
                                                      startDate: (startDate) {
                                                        setState(() {
                                                          _startDate =
                                                              startDate;
                                                        });
                                                      },
                                                    )));
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            end,
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            _endDate ?? "Select Date",
                                            style: style,
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Description",
                                  style: style,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 150,
                                  child: CustomTextField(
                                    maxLines: 4,
                                    hint: "",
                                    prefix: const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: SizedBox()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Create  ",
                                            style: style.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 22,
          )),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          CustomTextField(
            hint: "Search task",
            prefix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(iconSearch),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "My Task",
              style: basicStyle.copyWith(fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTabs(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                      controller.jumpToPage(selectedIndex);
                    },
                    label: "Today",
                    style:
                        selectedIndex == 0 ? selectedStyle : unselectedStyle),
                CustomTabs(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });

                      controller.jumpToPage(selectedIndex);
                    },
                    label: "Upcoming",
                    style:
                        selectedIndex == 1 ? selectedStyle : unselectedStyle),
                CustomTabs(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });

                      controller.jumpToPage(selectedIndex);
                    },
                    label: "Due Soon",
                    style:
                        selectedIndex == 2 ? selectedStyle : unselectedStyle),
                CustomTabs(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });

                      controller.jumpToPage(selectedIndex);
                    },
                    label: "Completed",
                    style:
                        selectedIndex == 3 ? selectedStyle : unselectedStyle),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 800,
              child: PageView(
                physics: const ScrollPhysics(),
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                  controller.jumpToPage(selectedIndex);
                },
                children: [
                  Column(
                    children: List.generate(tasks.length, (index) {
                      var data = tasks[index];
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SingleTask(
                            onTap: (){
                              Navigator.pushNamed(context, routeTaskDetail,arguments: data);
                            },
                            title: data['title'],
                            subtitle: data['subtitle'],
                            status: data['status'],
                            date: data['date'],
                          ));
                    }),
                  ),
                  Column(
                    children: List.generate(tasks.length, (index) {
                      var data = tasks[index];
                      if (data['status'] == "On Progress") {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SingleTask(
                              onTap: (){
                                Navigator.pushNamed(context, routeTaskDetail,arguments: data);
                              },
                              title: data['title'],
                              subtitle: data['subtitle'],
                              status: data['status'],
                              date: data['date'],
                            ));
                      }
                      return const SizedBox();
                    }),
                  ),
                  Column(
                    children: List.generate(tasks.length, (index) {
                      var data = tasks[index];
                      if (data['status'] == "Over Due") {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SingleTask(
                              onTap: (){
                                Navigator.pushNamed(context, routeTaskDetail,arguments: data);
                              },
                              title: data['title'],
                              subtitle: data['subtitle'],
                              status: data['status'],
                              date: data['date'],
                            ));
                      }
                      return const SizedBox();
                    }),
                  ),
                  Column(
                    children: List.generate(tasks.length, (index) {
                      var data = tasks[index];
                      if (data['status'] == "Completed") {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SingleTask(
                              onTap: (){
                                Navigator.pushNamed(context, routeTaskDetail,arguments: data);
                              },
                              title: data['title'],
                              subtitle: data['subtitle'],
                              status: data['status'],
                              date: data['date'],
                            ));
                      }
                      return const SizedBox();
                    }),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
