import 'package:flutter/material.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';
import 'package:main/utilities/styles.dart';

class UiKitItemContent extends StatelessWidget {
  final ItemContentUiModel data;
  const UiKitItemContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              data.title,
              style: kSmallContentStyle,
            ),
          ),
        ],
      ),
    );
  }
}
