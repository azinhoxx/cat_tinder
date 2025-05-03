import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/network_cubut/network_state.dart';
import 'package:cat_tinder/main.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar({required NetworkState state}) {
  if (state != NetworkState.connected() &&
      state != NetworkState.disconnected()) {
    return;
  }

  final messenger = rootScaffoldMessengerKey.currentState;
  final context = rootScaffoldMessengerKey.currentContext;

  if (messenger == null || context == null) return;

  messenger.clearSnackBars();

  messenger.showSnackBar(
    SnackBar(
      elevation: 0.0,
      dismissDirection: DismissDirection.down,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 60.0),
      backgroundColor: Colors.transparent,
      content: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blueGrey, width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              state == const NetworkState.connected()
                  ? const Icon(
                    AppIcons.toastCheck,
                    color: Colors.green,
                    size: 20.0,
                  )
                  : const Icon(
                    AppIcons.toastWarning,
                    color: Colors.red,
                    size: 20.0,
                  ),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  state == const NetworkState.connected()
                      ? 'Network connection restored'
                      : 'Network connection lost',
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      duration:
          state == const NetworkState.connected()
              ? const Duration(seconds: 3)
              : const Duration(days: 1),
    ),
  );
}
