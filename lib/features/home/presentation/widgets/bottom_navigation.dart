import 'package:flutter/material.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.onMiddleButtonPresed,
    required this.onNavButtonsPressed,
  }) : super(key: key);

  final Function(int) onNavButtonsPressed;
  final Function() onMiddleButtonPresed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavButton(
            label: 'Home',
            icon: Icons.home,
            selected: true,
            onPressed: () => onNavButtonsPressed(0),
          ),
          NavButton(
            label: 'Statistics',
            child: const Image(image: AssetImage('assets/images/chart.png')),
            onPressed: () => onNavButtonsPressed(1),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(blurRadius: 20, color: Colors.black12)
                ],
              ),
              child: const Image(image: AssetImage('assets/images/plus.png')),
            ),
            onTap: () => onMiddleButtonPresed(),
          ),
          NavButton(
            label: 'My card',
            child: const Image(
                image: AssetImage('assets/images/wallet_outlined.png')),
            onPressed: () => onNavButtonsPressed(2),
          ),
          NavButton(
            label: 'Profile',
            child: const Image(
                image: AssetImage('assets/images/profile_outlined.png')),
            onPressed: () => onNavButtonsPressed(3),
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    required this.onPressed,
    this.icon,
    this.label,
    this.child,
    this.selected = false,
    this.iconSize = 32,
    Key? key,
  })  : assert(child != null || icon != null),
        super(key: key);

  final Widget? child;
  final double iconSize;
  final IconData? icon;
  final String? label;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child ??
                Icon(
                  icon,
                  size: iconSize,
                  color: selected ? Colors.black : Colors.grey,
                ),
            if (label != null)
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  label!,
                  style: TextStyles.subHeader2
                      .copyWith(color: selected ? Colors.black : Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
