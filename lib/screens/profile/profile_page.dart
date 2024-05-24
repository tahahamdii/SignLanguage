import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:messagerie/controllers/profile_controller/profile_controller.dart';
import 'package:messagerie/core/storage/app_storage.dart';
import 'package:messagerie/screens/profile/signin_page.dart';
import 'package:messagerie/screens/profile/update_profil_page.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Profile'), 
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildUserInfo(context), 
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Couleur de fond du container
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SettingsGroup(
                      items: [
                        SettingsItem(
                          onTap: () {
                            controller.toggleDarkMode();
                          },
                          icons: Icons.dark_mode_rounded,
                          iconStyle: IconStyle(
                            iconsColor: Colors.white,
                            withBackground: true,
                            backgroundColor: Colors.purple,
                          ),
                          title: 'Dark mode',
                          subtitle: controller.darkModeEnabled ? "Enabled" : "Disabled",
                          trailing: Switch.adaptive(
                            value: controller.darkModeEnabled,
                            onChanged: (value) {
                              controller.toggleDarkMode();
                            },
                          ),
                        ),
                        SettingsItem(
                          onTap:() {
                            Get.to(UpdateProfilPage());
                          },
                          icons: Icons.edit_outlined,
                          title: "Edit Profile",
                        ),
                        SettingsItem(
                          onTap: () {
                            controller.showChangePasswordDialog(context);
                          },
                          icons: Icons.lock_rounded,
                          title: "Change Password",
                        ),
                        SettingsItem(
                          onTap: () {},
                          icons: Icons.language,
                          title: "Language",
                          subtitle: "English",
                        ),
                        SettingsItem(
                          onTap: () {},
                          icons: CupertinoIcons.delete_solid,
                          title: "Delete account",
                          titleStyle: TextStyle(
                            color: Color.fromARGB(255, 186, 3, 3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), 
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: () => Get.to(LoginPage()),
              icon: Icon(
                Icons.exit_to_app_outlined,
                color: Colors.purple, 
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildUserInfo(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 215, 176, 222), // Couleur lilas clair
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('asset/images/mm.jpg'), // Mettez à jour le chemin si nécessaire
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppStorge.readUsername()}', // Afficher dynamiquement le nom d'utilisateur
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${AppStorge.readEmail()}', // Afficher dynamiquement l'e-mail
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

}
