import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'header_viewmodel.dart'; // Make sure to create this ViewModel
import 'package:badges/badges.dart' as badges;

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
    this.background,
    this.title,
    this.showNotification = true,
    this.showBack = false,
    this.height,
    this.children,
    this.borderRadius,
    this.showCart = true,
  }) : super(key: key);

  final String? title;
  final String? background;
  final List<Widget>? children;
  final double? height;
  final bool showCart;
  final BorderRadius? borderRadius;
  final bool showBack;
  final bool showNotification;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HeaderViewModel>.reactive(
      viewModelBuilder: () => HeaderViewModel(),
      builder: (context, model, child) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: showBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back_sharp, color: Colors.grey),
                onPressed: model.goBack,
              )
            : null,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.tag_faces, color: Colors.pink),
            const SizedBox(width: 4),
            Text(
              'Kiddie',
              style: TextStyle(
                fontFamily: 'Roboto', // Replace with your desired font family
                fontSize: 24,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          if (showNotification)
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeContent: const Text(
                '150',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.grey),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ),
          if (showCart)
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeContent: const Text(
                '15',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.grey),
                onPressed: () {
                  // Handle cart button press
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
