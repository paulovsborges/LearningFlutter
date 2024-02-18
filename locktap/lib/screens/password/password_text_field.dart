import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_controller.dart';

import '../../util/app_style.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  _PasswordTextField createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  final TextEditingController _textFieldController = TextEditingController(text: '');
  final int passwordMaxLength = 4;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildFilledCharIndicator(bool isFilled) {
    Color backgroundColor;

    if (isFilled) {
      backgroundColor = AppColors.lightBlue;
    } else {
      backgroundColor = AppColors.gray;
    }

    return CircleAvatar(
      radius: 5,
      backgroundColor: backgroundColor,
    );
  }

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Color borderColor;

    if (_focusNode.hasFocus) {
      borderColor = AppColors.lightBlue;
    } else {
      borderColor = Colors.transparent;
    }

    var state = GetIt.I.get<PasswordController>().state;

    if (state.step == PasswordStep.repeat && !state.isCreatedPasswordValid) {
      borderColor = AppColors.error;
    }

    return Container(
      height: 52,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border(
          top: BorderSide(color: borderColor),
          bottom: BorderSide(color: borderColor),
          left: BorderSide(color: borderColor),
          right: BorderSide(color: borderColor),
        ),
        color: AppColors.gray200,
      ),
      child: Center(
        child: Stack(
          children: [
            TextField(
              cursorHeight: 0,
              cursorColor: Colors.transparent,
              enableInteractiveSelection: false,
              maxLength: passwordMaxLength,
              focusNode: _focusNode,
              onChanged: (text) {
                setState(() {
                  if (text.length == passwordMaxLength) {
                    var controller = GetIt.I.get<PasswordController>();

                    switch (controller.state.step) {
                      case PasswordStep.create:
                        _textFieldController.clear();
                        controller.goToRepeatPassword(text);
                      case PasswordStep.repeat:
                        controller.validateCreatedPassword(text);
                      case PasswordStep.enter:
                    }
                  }
                });
              },
              onTap: () {
                setState(() {
                  // isFocused = true;
                });
              },
              onTapOutside: (event) {
                setState(() {
                  _focusNode.unfocus();
                });
              },
              keyboardType: TextInputType.number,
              controller: _textFieldController,
              style: const TextStyle(
                color: Colors.transparent,
                decorationColor: Colors.transparent,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, counterText: ''),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFilledCharIndicator(_textFieldController.value.text.isNotEmpty),
                  _buildFilledCharIndicator(_textFieldController.value.text.length > 1),
                  _buildFilledCharIndicator(_textFieldController.value.text.length > 2),
                  _buildFilledCharIndicator(_textFieldController.value.text.length == 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
