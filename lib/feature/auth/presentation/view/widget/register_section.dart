import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/widget/custom_button.dart';
import 'package:to_do_app/core/widget/custom_dropdown.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
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

  // تعريف المتغيرات لتخزين القيم
  String? name, phoneNumber, yearsOfExperience, address, password;
  String? selectedExperienceLevel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
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
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),

                // حقل الاسم
                CustomTextFormField(
                  hintText: 'Name...',
                  onChanged: (value) => name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // حقل رقم الهاتف
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
                  onChanged: (value) => phoneNumber = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // حقل سنوات الخبرة
                CustomTextFormField(
                  hintText: 'Years of experience',
                  onChanged: (value) => yearsOfExperience = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your years of experience';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // قائمة تحديد مستوى الخبرة
                CustomDropdown(
                  onChanged: (value) {
                    setState(() {
                      selectedExperienceLevel = value;
                    });
                  },
                  items: [
                    'Entry Level',
                    'Mid Level',
                    'Senior Level',
                    'Manager',
                  ],
                ),
                const SizedBox(height: 15),

                // حقل العنوان
                CustomTextFormField(
                  hintText: 'Address',
                  onChanged: (value) => address = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // حقل كلمة المرور
                CustomTextFormField(
                  hintText: 'Password...',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // زر التسجيل
                state is RegisterLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        title: 'Sign Up',
                        onTap: () {
                          FocusScope.of(context)
                              .unfocus(); // إغلاق لوحة المفاتيح

                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            if (selectedExperienceLevel == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please select an experience level')),
                              );
                              return;
                            }

                            context.read<RegisterCubit>().register(
                                  name: name!,
                                  phoneNumber: phoneNumber!,
                                  experienceYear: yearsOfExperience!,
                                  experienceLevel: selectedExperienceLevel!,
                                  address: address!,
                                  password: password!,
                                );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                const SizedBox(height: 24),

                // الانتقال إلى صفحة تسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
