import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/widget/custom_button.dart';
import 'package:to_do_app/core/widget/custom_dropdown.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
import 'package:to_do_app/core/widget/experience_years_text_field.dart';
import 'package:to_do_app/feature/auth/presentation/manger/register_cubit/register_cubit.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isPasswordVisible = false;
  String? name, phoneNumber, address, password;
  String? selectedExperienceLevel;
  int? yearsOfExperience;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('success')),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'Name...',
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    return 'enter your name';
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: '123 456-7890',
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.flag),
                      SizedBox(width: 5),
                      Text("+20"),
                    ],
                  ),
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  validator: (value) {
                    return 'enter phone number';
                  },
                ),
                const SizedBox(height: 15),
                ExperienceYearsTextField(
                  hintText: 'Years of experience',
                  onChanged: (value) {
                    yearsOfExperience = value;
                  },
                ),
                // CustomTextFormField(
                //   hintText: 'Years of experience',
                //   onChanged: (value) {
                //     yearsOfExperience = value;
                //   },
                //   validator: (value) {
                //     return 'enter Years of experience';
                //   },
                // ),
                const SizedBox(height: 15),
                CustomDropdown(
                    onChanged: (value) {
                      setState(() {
                        selectedExperienceLevel = value;
                      });
                    },
                    items: const [
                      //fresh , junior , midLevel , senior
                      'fresh',
                      'junior',
                      'midLevel',
                      'senior',
                    ]),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Address',
                  onChanged: (value) {
                    address = value;
                  },
                  validator: (value) {
                    return 'enter your address';
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'password..',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onTapSuffixIcon: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    return 'enter your password';
                  },
                ),
                const SizedBox(height: 24),
                state is RegisterLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        title: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          context.read<RegisterCubit>().register(
                              name: name!,
                              phoneNumber: phoneNumber!,
                              experienceYear: yearsOfExperience!,
                              experienceLevel: selectedExperienceLevel!,
                              address: address!,
                              password: password!);
                        },
                      ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have any account? '),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
