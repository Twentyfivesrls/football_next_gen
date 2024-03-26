import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/bloc/profile/single_post_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../../widgets/buttons.dart';

class PostDetail extends StatelessWidget {
  final int id;
  final String returnPage;

  const PostDetail({super.key, required this.id, required this.returnPage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SinglePostCubit(),
        )
      ],
      child: PostDetailWidget(
        id: id,
        returnPage: returnPage,
      ),
    );
  }
}

class PostDetailWidget extends StatefulWidget {
  final int id;
  final String returnPage;

  const PostDetailWidget(
      {super.key, required this.id, required this.returnPage});

  @override
  State<StatefulWidget> createState() => PostDetailState();
}

class PostDetailState extends State<PostDetailWidget> {
  SinglePostCubit get _postCubit => context.read<SinglePostCubit>();

  final String sportsCenterName = 'Sport Center srl';
  bool selected = false;
  bool edit = false;
  final TextEditingController descriptionController = TextEditingController();
  bool _isCubitClosed = false;

/* List <PopupMenuItem> items = [
    PopupMenuItem(
      child: Text14(text: getCurrentLanguageValue(EDIT) ?? ""),
      value: getCurrentLanguageValue(EDIT),
      onTap: (){
        setState(() {
          edit = !edit;
        });
      },
    ),

    PopupMenuItem(
      child: Text14(text: getCurrentLanguageValue(DELETE) ?? ""),
      value: getCurrentLanguageValue(DELETE),
      onTap: (){},
    ),
  ]; */

  List<String> list = ['Modifica', 'Elimina'];

  @override
  void initState() {
    _postCubit.fetchPost(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _isCubitClosed = true; // Imposta il flag su true quando il cubit viene chiuso
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 30,
      appBar: 3,
      showFirstTrailingIcon: false,
      title: AppPage.postDetail.toTitle,
      firstTrailingIconOnTap: () {},
      secondTrailingIconOnTap: () {},
      goBack: () {
        context.push(widget.returnPage);
      },
      body: SingleChildScrollView(
        child: BlocBuilder<SinglePostCubit, SinglePostPageState>(
            builder: (_, state) {
          if (state is SinglePostPageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SinglePostPageLoaded) {
            descriptionController.text = state.post.description;
            return Column(
              children: [
                headerSection(),
                imageSection(state.post.image),
                descriptionSection(state.post.description, state.post.date),
                buttonsSection(state.post)
              ],
            );
          } else {
              return Text('Post deleted successfully');
            }

        }),
      ),
    );
  }

  Widget headerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(ImagesConstants.sportsCenterProfileImg,
                  height: 30, width: 30),
            ),
            Text14(
              text: sportsCenterName,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        PopupMenuButton(
          elevation: 5,
          icon: const Icon(
            Icons.more_vert,
            color: black25,
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
                onTap: () {
                  setState(() {
                    edit = !edit;
                  });
                },
                value: getCurrentLanguageValue(EDIT),
                child: Text14(text: getCurrentLanguageValue(EDIT) ?? "")),
            PopupMenuItem(
                onTap: () {
                  if (!_isCubitClosed) { // Verifica se il cubit è stato chiuso
                    _postCubit.fetchDeletePost(widget.id);
                  }
                },
                value: getCurrentLanguageValue(DELETE),
                child: Text14(text: getCurrentLanguageValue(DELETE) ?? "")),
          ],
        ),

        /*   PopupMenuWidget(
            items: items,
        ) */
      ],
    );
  }

  Widget imageSection(String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(ImagesConstants.postImg),
    );
  }

  Widget descriptionSection(String description, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Icon(
                    selected ? Icons.favorite : Icons.favorite_border_outlined,
                    color: selected ? Colors.red : black25,
                    size: 25,
                  )),
              GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.share_outlined,
                    color: black25,
                    size: 25,
                  )),
            ],
          ),
        ),
        Visibility(
          visible: !edit,
          child: InfoBoxWidget(
            labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
            showIcon: false,
            text: description,
          ),
        ),
        Visibility(
            visible: edit,
            child: InputWidget(
              labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
              controller: descriptionController,
              hintText: getCurrentLanguageValue(DESCRIPTION) ?? "",
              minLines: 4,
              maxLines: 20,
            )),
        Visibility(
          visible: !edit,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text14(text: date.toString()),
          ),
        ),
      ],
    );
  }

  Widget buttonsSection(PostEntity post) {
    return Visibility(
        visible: edit,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ActionButton(
                onPressed: () {
                  final postEntity = PostEntity(
                      image: post.image,
                      description: descriptionController.text,
                      likes: post.likes,
                      favorite: post.favorite,
                      date: post.date
                  );
                  setState(() {
                    _postCubit.fetchUpdatePost(postEntity, widget.id);
                    edit = !edit;
                  });
                },
                text: getCurrentLanguageValue(SAVE) ?? "",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ActionButton(
                  onPressed: () {
                    setState(() {
                      edit = !edit;
                    });
                  },
                  text: getCurrentLanguageValue(CANCEL) ?? "",
                  backgroundColor: cancelGrey,
                  borderColor: cancelGrey,
                ),
              )
            ],
          ),
        ),
      );
  }
}
