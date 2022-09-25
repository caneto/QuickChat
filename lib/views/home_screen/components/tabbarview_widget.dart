import 'package:flutter/material.dart';
import '../../views.dart';

Widget tabbarView() {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: TabBarView(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: chats(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: statusWidget(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  );
}
