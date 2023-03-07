import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bonnou/utils/constants.dart';
import 'package:bonnou/routes/routes.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                //bottomRight: Radius.circular(20),
                //bottomLeft: Radius.circular(20)),),
              ),
              color: Colors.blue.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                'Bonnou',
                style: textStyleBoldBlack(24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.home,
                  label: 'Accueil',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getHomeRoute());
                  },
                ),
                verticalSpace(16),
                DrawerItem(
                  icon: Icons.create,
                  label: 'Créer un lien RSS',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateRssRoute());
                  },
                ),
                verticalSpace(16),
                DrawerItem(
                  icon: Icons.list,
                  label: 'Liste des liens RSS',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getAllRssPageRoute());
                  },
                ),
                verticalSpace(16),
                DrawerItem(
                  icon: Icons.gpp_bad_outlined,
                  label: 'Nouvelles indésirables',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getBadNewsRoute());
                  },
                ),
                verticalSpace(16),
                DrawerItem(
                  icon: Icons.settings,
                  label: 'Paramètres',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getSettingsRoute());
                  },
                ),
                verticalSpace(16),
                DrawerItem(
                  icon: Icons.question_mark,
                  label: 'A propos',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getAboutRoute());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            label,
            style: textStyleBlack(20),
          ),
        ],
      ),
    );
  }
}