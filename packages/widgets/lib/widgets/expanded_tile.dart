import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpandedTile extends StatefulWidget {
  final Widget title, subtitle, trailing;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isExpanded, hideArrow;

  const ExpandedTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.isExpanded = false,
    this.children = const [],
    this.hideArrow = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  bool isExpanded = false;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  void setIsExpanded(bool value) {
    isExpanded = value;
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ExpandedTile oldWidget) {
    if (widget.isExpanded != oldWidget.isExpanded) {
      setIsExpanded(widget.isExpanded);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.children.isEmpty ? null : setIsExpanded(!isExpanded),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linearToEaseOut,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: widget.crossAxisAlignment,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: widget.crossAxisAlignment,
                      children: [
                        widget.title,
                        const Gap(8),
                        widget.subtitle,
                      ],
                    ),
                  ),
                  widget.trailing,
                  if (!widget.hideArrow)
                    Row(
                      children: [
                        const Gap(30),
                        _arrowIcon(),
                      ],
                    ),
                ],
              ),
              if (isExpanded) const Gap(10),
              if (isExpanded) ...widget.children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _arrowIcon() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutBack,
      tween: Tween<double>(
          begin: !isExpanded ? 180 : 0, end: !isExpanded ? 0 : 180),
      child: const Icon(Icons.keyboard_arrow_down),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * pi / 180,
          child: child,
        );
      },
    );
  }
}
