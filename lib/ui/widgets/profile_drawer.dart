import 'package:flutter/material.dart';
import 'package:shopping_cart/shared/constants.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key, required this.logOut});

  final VoidCallback logOut;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      Theme.of(context).colorScheme.primary.withOpacity(1),
                    ])),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      "Usernamoiaufyewgdkdsfkuske",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(kURL),
                    radius: 24,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Add item",
              style: TextStyle(fontSize: 24),
            ),
            leading: const Icon(
              Icons.add_circle_outline,
            ),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            trailing: IconButton(
              onPressed: logOut,
              icon: const Icon(Icons.logout),
              iconSize: 28,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
