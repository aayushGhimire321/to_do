import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_app/constants/app_image.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/constants/styles.dart';
import 'package:todo_app/pages/settings/components/single_settings.dart';
import 'package:todo_app/widgets/styled_switch.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: ListTile(
          minVerticalPadding: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.settings,
                size: 25,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(avatar),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lady Anna", style: basicStyle.copyWith(fontSize: 18)),
                Text(
                  "ladyanna@gmail.com",
                  style: basicGrey,
                ),
              ],
            ),
            trailing: Image.asset(edit, height: 40),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Notification",
            style: GoogleFonts.inter(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleSettings(
            trailing: StyledSwitch(onToggled: (value){},toogle: true),
            leading: Image.asset(settingsNotification),
            label: "Turn on",
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SingleSettings(
              trailing: StyledSwitch(onToggled: (value){},toogle: false),
              leading: Image.asset(settingsMore),
              label: "Push notification",
            ),
          ),


          SingleSettings(
            trailing: StyledSwitch(onToggled: (value){},toogle: false),
            leading: Image.asset(settingsMore),
            label: "Sync with GCal",
          ),
          SizedBox(height: 50,),
          InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, routeSignIn);
              },
              child: Text("Log out",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 17,color: const Color(0xFFFF6A5D)),))
        ],

      ),
    );
  }
}


