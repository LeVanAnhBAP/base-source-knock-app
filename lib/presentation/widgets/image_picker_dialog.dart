
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';

import '../../assets.gen.dart';
import '../../core/languages/translation_keys.g.dart';

Future showImagePickerDialog({
  required BuildContext context,
  void Function(ImageSource imageSource)? handleImagePicker,
}) async{
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      handleImagePicker?.call(ImageSource.gallery);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            context.tr(LocaleKeys.PhotoLibrary),
                            style: context.typographies.title3
                                .withColor(context.colors.tertiary),
                          ),
                          Expanded(child: Container()),
                          AssetGenImage(Assets.icons.png.icGallery.path)
                              .image(width: 30),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: context.colors.divider,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      handleImagePicker?.call(ImageSource.camera);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            context.tr(LocaleKeys.TakeAPhoto),
                            style: context.typographies.title3
                                .withColor(context.colors.tertiary),
                          ),
                          Expanded(child: Container()),
                          AssetGenImage(Assets.icons.png.icCameraBlue.path)
                              .image(width: 30),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: context.colors.divider,
                  ),
                  InkWell(
                    onTap: () async{
                      Navigator.pop(context);
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        allowMultiple: false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            context.tr(LocaleKeys.FileSelection),
                            style: context.typographies.title3
                                .withColor(context.colors.tertiary),
                          ),
                          Expanded(child: Container()),
                          AssetGenImage(Assets.icons.png.icFile.path)
                              .image(width: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width * 0.95,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  context.tr(LocaleKeys.Cancel),
                  style:
                  context.typographies.title3Bold.withColor(Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}