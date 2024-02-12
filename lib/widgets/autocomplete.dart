import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../constants/colors.dart';

class AutocompleteWidget extends StatelessWidget {
  List<String> kOptions = [];
  final String hintText;
  final bool showLabel;
  final String labelText;
  final FontWeight labelFontWeight;
  final TextAlign labelAlign;
  final Color labelColor;
  final double labelPaddingBottom;
  final double labelPaddingTop;
  final double labelPaddingRight;
  final double labelPaddingLeft;

  AutocompleteWidget({
    super.key,
    required this.kOptions,
    required this.hintText,
    this.showLabel = true,
    this.labelText = '',
    this.labelPaddingBottom = 10,
    this.labelPaddingLeft = 0,
    this.labelPaddingRight = 0,
    this.labelPaddingTop = 0,
    this.labelAlign = TextAlign.start,
    this.labelFontWeight = FontWeight.w600,
    this.labelColor = black25,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: showLabel,
            child: InputText(
              text: labelText,
              paddingBottom: labelPaddingBottom,
              paddingLeft: labelPaddingLeft,
              paddingRight: labelPaddingRight,
              paddingTop: labelPaddingTop,
              textColor: labelColor,
              fontWeight: labelFontWeight,
              textAlign: labelAlign,
            ),
          ),
          RawAutocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              return kOptions.where((String option) {
                return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
            },
            fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
                ) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onFieldSubmitted: (String value) {
                  onFieldSubmitted();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: opaqueBlack25)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: opaqueBlack25)),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: opaqueBlack25,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              );
            },
            optionsViewBuilder: (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
                ) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: SizedBox(
                    height: 60.0 * options.length,
                    width: constraints.biggest.width,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(option),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
