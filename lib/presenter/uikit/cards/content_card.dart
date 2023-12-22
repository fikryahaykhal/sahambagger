import 'package:flutter/material.dart';
import 'package:main/components/trasnparent_card.dart';
import 'package:main/domain/uimodel/item_content_ui_model.dart';

class UiKitItemContent extends StatelessWidget {
  final ItemContentUiModel data;
  const UiKitItemContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data.imageUrl))),
          ),
          Text(data.title),
        ],
      ),
    );
  }
}
