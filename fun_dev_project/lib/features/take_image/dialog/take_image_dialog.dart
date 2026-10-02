import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fun_dev_project/l10n/app_localizations.dart';

import '../cubit/take_images_cubit.dart';

class TakeImageDialog extends StatelessWidget {
  const TakeImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.chooseAnOption),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              context.read<TakeImagesCubit>().takeImages(
                isSingle: true,
                source: ImageSource.camera,
              );
            },
            leading: Icon(Icons.camera_alt),
            title: Text(AppLocalizations.of(context)!.camera),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              context.read<TakeImagesCubit>().takeImages(
                isSingle: true,
                source: ImageSource.gallery,
              );
            },
            leading: Icon(Icons.photo_library),
            title: Text(AppLocalizations.of(context)!.gallery),
          ),
        ],
      ),
    );
  }
}
