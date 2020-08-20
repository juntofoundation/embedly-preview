import 'package:embedly_preview/const.dart';
import 'package:embedly_preview/models/embedly_response_model.dart';
import 'package:embedly_preview/theme/embedly_theme.dart';
import 'package:embedly_preview/widgets/link_preview.dart';
import 'package:embedly_preview/theme/theme.dart';
import 'package:flutter/material.dart';

class OEmbedWidget extends StatefulWidget {
  OEmbedWidget({
    Key key,
    @required this.data,
    this.theme,
  }) : super(key: key);

  final OEmbedResponse data;
  final EmbedlyThemeData theme;

  @override
  _OEmbedWidgetState createState() => _OEmbedWidgetState();
}

class _OEmbedWidgetState extends State<OEmbedWidget> {
  EmbedlyThemeData _theme;
  @override
  void initState() {
    super.initState();
    updateTheme();
  }

  @override
  void didUpdateWidget(OEmbedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme != widget.theme) {
      updateTheme();
    }
  }

  void updateTheme() {
    _theme = widget.theme ?? EmbedlyThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return EmbedlyThemeProvider(
      data: _theme,
      child: Builder(
        builder: (BuildContext context) {
          switch (widget.data.type) {
            case OEmbedType.rich:
              return EmbedlyLinkPreview(
                data: widget.data,
              );
            case OEmbedType.link:
              return EmbedlyLinkPreview(
                data: widget.data,
              );
            case OEmbedType.photo:
              return SizedBox(
                height: widget.data.height ?? 300,
                width: widget.data.width,
                child: EmbedlyLinkPreview(
                  data: widget.data,
                ),
              );
            case OEmbedType.unsupported:
              return Container(
                child: Center(child: Text(Strings.unSupported)),
              );
            default:
              return SizedBox(
                height: widget.data.height ?? 300,
                width: widget.data.width,
                child: EmbedlyLinkPreview(
                  data: widget.data,
                ),
              );
          }
        },
      ),
    );
  }
}
