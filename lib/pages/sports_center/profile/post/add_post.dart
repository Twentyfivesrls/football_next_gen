import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/profile/create_post_cubit.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/app_pages.dart';
import '../../../../constants/language.dart';
import '../../../../models/confirm_page_data.dart';
import '../../../../widgets/dialog.dart';
import '../../../../widgets/divider.dart';

class AddPost extends StatelessWidget{
  const AddPost({super.key, required this.returnPage});
  final String returnPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreatePostCubit(),
      child:  AddPostWidget(returnPage: returnPage,),
    );
  }
}

class AddPostWidget extends StatefulWidget {
  final String returnPage;

  const AddPostWidget({super.key, required this.returnPage});

  @override
  State<StatefulWidget> createState() => AddPostState();
}

class AddPostState extends State<AddPostWidget> {
  final TextEditingController descriptionController = TextEditingController();
  XFile? imageFile;
  CreatePostCubit get _createPostCubit => context.read<CreatePostCubit>();

  @override
  Widget build(BuildContext context) {;
    return ScaffoldWidget(
      paddingTop: 30,
      appBar: 3,
      title: AppPage.addPost.toTitle,
      showFirstTrailingIcon: false,
      firstTrailingIconOnTap: () {},
      secondTrailingIconOnTap: () {},
      goBack: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogWidget(
                title: 'Avviso',
                message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del nuovo post?',
                confirmText: 'Elimina post',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(widget.returnPage);
                },
              );
            });
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text14(
              text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child:
              Text10(text: getCurrentLanguageValue(ACCEPTED_FORMATS) ?? ""),
            ),
            ActionButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: openGallery,
                              minWidth: MediaQuery.of(context).size.width,
                              height: 80,
                              elevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.photo_library_outlined,size: 30,color: primary,),
                                  ),
                                  Text18(
                                    text: "Galleria",
                                    textColor: primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              onPressed: openCamera,
                              minWidth: MediaQuery.of(context).size.width,
                              height: 80,
                              elevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              child:const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.camera_alt_outlined,size: 30,color: primary,),
                                  ),
                                  Text18(
                                    text: "Camera",
                                    textColor: primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
              showPrefixIcon: true,
              svgPrefixIcon: ImagesConstants.uploadImg,
              backgroundColor: secondary,
              borderColor: secondary,
              textColor: primary,
            ),


            imageFile != null ? Padding(
              padding: const EdgeInsets.only(top: 20),
                child: Image.file(File(imageFile!.path)
                )
            ) : Container(),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InputWidget(
                controller: descriptionController,
                labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
                hintText: getCurrentLanguageValue(DESCRIPTION) ?? "",
                minLines: 4,
                maxLines: 20,
              ),
            ),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget buttonsSection() {
    return BlocBuilder<CreatePostCubit,CreatePostState>(
        builder: (_,state) {

      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: DividerWidget(),
          ),
          ActionButton(
            onPressed: () {
              final postEntity = PostEntity(image: "image", description: descriptionController.text, likes: "likes", favorite: false, date:DateTime.now());
              _createPostCubit.fetchCreatePost(postEntity);
              context.push(AppPage.confirmPage.path,
                  extra: ConfirmPageData.addPostConfirmed(context));
            },
            text: getCurrentLanguageValue(NEXT) ?? "",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogWidget(
                        title: 'Avviso',
                        message:
                        'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del nuovo post?',
                        confirmText: 'Elimina post',
                        cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                        onConfirm: () {
                          context.go(widget.returnPage);
                        },
                      );
                    });
              },
              text: getCurrentLanguageValue(CANCEL) ?? "",
              backgroundColor: cancelGrey,
              borderColor: cancelGrey,
            ),
          )
        ],
      );
    });
  }

  openGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile = value;
      });
      context.pop();
    });
  }

  openCamera() {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile = value;
      });
      context.pop();
    });
  }
}
