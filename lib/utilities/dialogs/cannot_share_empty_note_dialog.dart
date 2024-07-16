import 'package:flutter/material.dart';
import 'package:ownotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: 'Your cannot share an empty note!',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
