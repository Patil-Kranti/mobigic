import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/ui/widgets/button_widget.dart';

class ResetDialog extends StatelessWidget {
  const ResetDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        // return false;
      },
      canPop: false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do you want to reset ?",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      type: ButtonType.secondary,
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      title: 'Cancel',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ButtonWidget(
                      type: ButtonType.primary,
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      title: 'Reset',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
