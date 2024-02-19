import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_controller.dart';

import '../../util/app_style.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({required this.passwordState});

  final int passwordMaxLength = 4;
  final PasswordState passwordState;

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

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 52,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border(
          top: BorderSide(color: passwordState.borderColor),
          bottom: BorderSide(color: passwordState.borderColor),
          left: BorderSide(color: passwordState.borderColor),
          right: BorderSide(color: passwordState.borderColor),
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
              focusNode: passwordState.focusNode,
              controller: passwordState.textEditingController,
              onChanged: (text) {
                var controller = GetIt.I.get<PasswordController>();
                controller.onPasswordChanged(text);
              },
              onTap: () {
                var controller = GetIt.I.get<PasswordController>();
                controller.onRequestFocus();
              },
              onTapOutside: (event) {
                var controller = GetIt.I.get<PasswordController>();
                controller.dismissNodeFocus();
              },
              keyboardType: TextInputType.number,
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
                  _buildFilledCharIndicator(
                    passwordState.lastFilledIndex > 0,
                  ),
                  _buildFilledCharIndicator(
                    passwordState.lastFilledIndex > 1,
                  ),
                  _buildFilledCharIndicator(
                    passwordState.lastFilledIndex > 2,
                  ),
                  _buildFilledCharIndicator(
                    passwordState.lastFilledIndex > 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
