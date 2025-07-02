import 'package:flutter/material.dart';

class VerifyTextFormFields extends StatefulWidget {
  final Function(String code) verifyCode;

  const VerifyTextFormFields({super.key, required this.verifyCode});

  @override
  State<StatefulWidget> createState() => _VerifyTextFormFieldsState();
}

class _VerifyTextFormFieldsState extends State<VerifyTextFormFields> {
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (_) => FocusNode());
    controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleTextChange(int index) {
    if (controllers[index].text.isNotEmpty) {
      if (index < focusNodes.length - 1) {
        focusNodes[index + 1].requestFocus();
      }
    } else if (index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    widget.verifyCode(getCode());
  }

  String getCode() {
    return controllers.map((controller) => controller.text).join('');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsive.width15),
          child: SizedBox(
            width: Dimensions.width65,
            height: Dimensions.height80,
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              maxLength: 1,
              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    required maxLength,
                  }) {
                    return null;
                  },
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.3),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.3),
                ),
              ),
              onChanged: (value) {
                handleTextChange(index);
              },
            ),
          ),
        );
      }),
    );
  }
}
