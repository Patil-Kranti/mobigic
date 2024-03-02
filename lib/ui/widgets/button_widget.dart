import 'package:flutter/material.dart';
import 'package:mobigic_test/utils/app_constants.dart';

enum ButtonType { primary, secondary, tertiary }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.title,
    this.child,
    required this.type,
    required this.onTap,
    this.disabledColor,
    this.color,
    this.height = 40,
    this.isLoading = false,
    this.radius,
  })  : assert(title == null || child == null, 'Cannot provide both a title and a child\n'),
        super(key: key);

  ///Button Title text
  final String? title;

  ///Button Title text
  final Widget? child;

  ///Button Type i.e. Primary or Secondary or Ternary
  final ButtonType type;

  ///Button isLoading if provided true will disable click on button and circular progress indicator will be visible
  final bool isLoading;

  ///Button buttonDisabled Color
  final Color? disabledColor;

  ///Button Color
  final Color? color;

  ///Button Height
  final double? height;

  ///Button Radius
  final double? radius;

  ///Button onTap()
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.primary) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppConstants.appGradient,
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
        child: Container(
          height: height,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor,
            gradient: AppConstants.appGradient,
            borderRadius: BorderRadius.circular(radius ?? 50),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? null : onTap,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(80, height!),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Center(
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return CircularProgressIndicator(
                      color: color ?? Colors.white,
                      strokeWidth: 2,
                    );
                  }

                  return child ??
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                },
              ),
            ),
          ),
        ),
      );
    } else if (type == ButtonType.secondary) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppConstants.appGradient,
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
        child: Container(
          height: height,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 50),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? null : onTap,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(80, height ?? 40),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Center(
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 2,
                    );
                  }

                  return child ??
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      );
                },
              ),
            ),
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: isLoading ? null : onTap,
        child: Builder(
          builder: (context) {
            if (isLoading) {
              return CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 2,
              );
            }
            if (child != null) {
              return child!;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          },
        ),
      );
    }
  }
}
