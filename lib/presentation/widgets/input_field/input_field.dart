import 'package:flutter/material.dart';
import 'package:nano_health_suite/utils/media_quary/size_config.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const InputField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.07,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
          ),
        ),
      ),
    );
  }
}

class PassWordInput extends StatefulWidget {
  final TextEditingController controller;
  const PassWordInput({super.key, required this.controller});

  @override
  State<PassWordInput> createState() => _PassWordInputState();
}

class _PassWordInputState extends State<PassWordInput> {
  bool _isVisiable = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.07,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: _isVisiable ? false : true,
              decoration: InputDecoration(
                label: const Text("Password"),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisiable = !_isVisiable;
                    });
                  },
                  icon: Icon(
                      _isVisiable ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
