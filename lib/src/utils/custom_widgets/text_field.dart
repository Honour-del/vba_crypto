import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  const InputField({Key? key, required this.label, required this.hint, this.suffixIcon, required this.keyboardType, this.controller, required this.obscure, this.validator,}) : super(key: key);

  final String? Function(String?)? validator;
  final String label;
  final String hint;
  final bool obscure;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(label,
                style: const TextStyle(
                  color: Colors.white, //TODO
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 25,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(14, 32, 51, 1),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0, color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ),
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(139, 139, 139, 1)
                  ),
                  suffixIcon: suffixIcon,
                ),
                style: const TextStyle(color: Colors.white),
                controller: controller,
                validator: validator,
                obscureText: obscure,
                keyboardType: keyboardType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
