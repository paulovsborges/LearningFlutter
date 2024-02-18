import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locktap/util/components/primary_text.dart';
import 'package:locktap/util/components/secondary_text.dart';

import '../../util/app_style.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static const valueKey = ValueKey('PasswordScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.secondaryBackground,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const PrimaryText(
                        label: 'Create password',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SecondaryText(
                        description: 'Create a four-digit password',
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomTextField(),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  Widget _buildCharacterIndicator(bool isFilled) {
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

  String currentTextValue = '';
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var borderColor =
        _focusNode.hasFocus ? AppColors.lightBlue : Colors.transparent;

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
              maxLength: 4,
              focusNode: _focusNode,
              onChanged: (text) {
                setState(() {
                  currentTextValue = text;
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
              controller: _controller,
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
                  _buildCharacterIndicator(currentTextValue.isNotEmpty),
                  _buildCharacterIndicator(currentTextValue.length > 1),
                  _buildCharacterIndicator(currentTextValue.length > 2),
                  _buildCharacterIndicator(currentTextValue.length == 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
