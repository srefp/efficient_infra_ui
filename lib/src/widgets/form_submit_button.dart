import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton({
    Key? key,
    required this.submit,
    required this.text,
  }) : super(key: key);

  final VoidCallback submit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              submit.call();
            },
            child: WinText(text),
          ),
        ),
      ],
    );
  }
}
