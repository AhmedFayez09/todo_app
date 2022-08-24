import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/core/constant/my_colors.dart';
import 'package:todo_route/logic/proviser.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<App_Provider>(context);
    return Container(
      // color: standeredColorDark,
      child: Column(
        children: [
          SizedBox(
            height: size.height * .06,
          ),
           Text("Language",style: Theme.of(context).textTheme.caption,),
          SwitchListTile(
            title:  Text("Theme Mode",style: Theme.of(context).textTheme.caption,),
            activeColor: standeredColor,
            activeTrackColor: lightmainbackgroundDark,
            inactiveThumbColor: whiteColor,
            inactiveTrackColor: whiteColor,
            value: provider.isChach,
            onChanged: (val) {
              provider.changeAppChach(val);

              provider.isChach
                  ? provider.chanchAppTheme(ThemeMode.dark)
                  : provider.chanchAppTheme(ThemeMode.light);
            
            
            // provider.saveprefs(val);
            
            
            
            },
          ),
       
        ],
      ),
    );
  }
}
