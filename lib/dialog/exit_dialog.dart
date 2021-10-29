import 'package:flutter/material.dart';
import 'package:silaper_korang/common/styles.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  _ExitDialogState createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(32.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Apakah Anda Yakin Ingin Keluar?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 2.0, height: 2.0, color: primaryColor),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(
                            child: Text(
                              "Tidak",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pop(context, false),
                      ),
                    ),
                    VerticalDivider(thickness: 2.0, color: primaryColor),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Ya",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pop(context, true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future openExitDialog(BuildContext context) {
  return showGeneralDialog(
    barrierLabel: "Exit Dialog",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Theme(
        data: tdMain,
        child: ExitDialog(),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: anim1.value,
        child: child,
      );
    },
  );
}
