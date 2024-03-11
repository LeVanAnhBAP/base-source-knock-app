import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uq_system_app/core/extensions/text_style.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_selector.dart';
import 'package:uq_system_app/presentation/widgets/image_picker_dialog.dart';

import '../../../../assets.gen.dart';
import '../../../../core/languages/translation_keys.g.dart';
import '../../../widgets/input_container.dart';
import '../create_site_bloc.dart';

class ImagesTab extends StatefulWidget {
  @override
  State<ImagesTab> createState() => _ImagesTabState();
}

class _ImagesTabState extends State<ImagesTab> {
  late CreateSiteBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<CreateSiteBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageBlock(1),
              const SizedBox(
                height: 10,
              ),
              _buildImageBlock(2)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildImageBlock(int imageType){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(imageType == 1 ? LocaleKeys.SiteDetail_Drawing : LocaleKeys.SiteDetail_OnSitePhoto),
            style: context.typographies.subBodyBold1,
          ),
          const SizedBox(
            height: 5,
          ),
          CreateSiteSelector(
            selector: (state) => imageType == 1 ?  state.siteParams.imageType1 :  state.siteParams.imageType2 ,
            builder: (data) {
              if (data.isEmpty) {
                return InkWell(
                  onTap: () {
                    showImagePickerDialog(
                        context: context,
                        handleImagePicker: (imageSource) {
                          _handelImageSelection(imageSource, imageType);
                        });
                  },
                  child: InputContainer(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InputContainer(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 30),
                            backgroundColor: Colors.white,
                            child: Column(
                              children: [
                                AssetGenImage(
                                    Assets.icons.png.icGallery.path)
                                    .image(width: 35),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  context.tr(LocaleKeys.SiteDetail_Upload),
                                  style: context.typographies.bodyBold
                                      .withColor(context.colors.tertiary),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => _buildImageItem(index : index ,url: data[index].url, imageType: imageType),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showImagePickerDialog(
                      context: context,
                      handleImagePicker: (imageSource) {
                        _handelImageSelection(imageSource, imageType);
                      });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.svg.icPlus.path,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      context.tr(imageType == 1 ? LocaleKeys.SiteDetail_AddDrawing : LocaleKeys.SiteDetail_AddOnSitePhoto),
                      style: context.typographies.subBodyBold1
                          .withColor(context.colors.tertiary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
  Widget _buildImageItem({required int index,required String url, required int imageType}){
    return InputContainer(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical:40 ),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: (){
                  _bloc.add(CreateSiteEvent.removeImage(index: index, imageType: imageType));
                },
                child: SvgPicture.asset(
                  Assets.icons.svg.icTrashCan.path,
                  width: 25,
                ),
              ),
            )
          ],
        ));
  }
  void _handelImageSelection(ImageSource imageSource, int imageType) async {
    if (imageSource == ImageSource.camera) {
      final returnedImage = await ImagePicker().pickImage(source: imageSource);
      if (returnedImage == null) return;
      _bloc.add(CreateSiteEvent.addImages(
          images: [File(returnedImage.path)], imageType: imageType));
    } else {
      final List<XFile> images = await ImagePicker().pickMultiImage();
      if (images.isEmpty) return;
      _bloc.add(CreateSiteEvent.addImages(
          images: images.map((e) => File(e.path)).toList(),
          imageType: imageType));
    }
  }
}
