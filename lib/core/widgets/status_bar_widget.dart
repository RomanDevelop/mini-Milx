import 'package:flutter/material.dart';

class ModernStatusBar extends StatelessWidget {
  final bool showDynamicIsland;

  const ModernStatusBar({
    super.key,
    this.showDynamicIsland = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Время
          Text(
            '11:30',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          // Dynamic Island (если включена)
          if (showDynamicIsland)
            Container(
              width: 100,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
            ),

          // Иконки статуса
          Row(
            children: [
              // Wi-Fi
              Icon(
                Icons.wifi,
                color: Colors.white,
                size: 16,
              ),

              const SizedBox(width: 8),

              // Батарея
              Container(
                width: 24,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Container(
                  margin: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
