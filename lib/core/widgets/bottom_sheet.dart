import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<Object?> showSimpleCustomModalBottomSheet(BuildContext context,
    {required Widget content,
    double? height,
    Widget? closeIcon,
    bool? isDismissible,
    bool? enableDrag}) {
  return showModalBottomSheet<Object?>(
    enableDrag: enableDrag ?? false,
    isDismissible: isDismissible ?? false,
    elevation: 8,
    backgroundColor: Colors.white,
    useSafeArea: true,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'AppSemantics.close',
                    child: closeIcon ??
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.close,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            content,
          ],
        ),
      );
    },
  );
}

Future<Object?> showCustomModalBottomSheet(BuildContext context,
    {required String title,
    required WidgetBuilder contentBuilder,
    bool? hideHeaderParam,
    double? height,
    bool? isDismissible}) {
  final hideHeader = hideHeaderParam ?? false;
  return showModalBottomSheet<Object?>(
    enableDrag: isDismissible ?? true,
    isDismissible: isDismissible ?? true,
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      final Size screenSize = MediaQuery.of(context).size;
      return Container(
        height: height ?? screenSize.height * 0.50,
        width: screenSize.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: !hideHeader,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              title,
            ),
            contentBuilder(context)
          ],
        ),
      );
    },
  );
}

