import 'package:centralogic_assignment/features/blocs/register_page/register_bloc.dart';
import 'package:centralogic_assignment/features/blocs/register_page/register_event.dart';
import 'package:centralogic_assignment/features/blocs/register_page/register_state.dart';
import 'package:centralogic_assignment/features/pages/home_page.dart';
import 'package:centralogic_assignment/features/pages/login_page.dart';
import 'package:centralogic_assignment/features/widgets/book_interent_select.dart';
import 'package:centralogic_assignment/features/widgets/gender_select.dart';
import 'package:centralogic_assignment/features/widgets/input_field_label.dart';
import 'package:centralogic_assignment/features/widgets/rounded_button.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(backgroundColor: AppColors.white,),
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if(state.isSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registered Successfully!"), duration: const Duration(seconds: 1))
              );
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false
              );
            }
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state){
              final bloc = context.read<RegisterBloc>();
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register", style: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w700)),
                          Text("Create account", style: TextStyle(color: AppColors.greyOne, fontSize: 16)),
                        ],
                      ),
                    
                      // input fields
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  
                          // name
                          InputFieldLabel(text: "Name"),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Your name",
                              hintStyle: TextStyle(color: AppColors.greyOne),
                            ),
                            onChanged: (value) => bloc.add(NameChanged(value)),
                          ),
                  
                          SizedBox(height: 10),
                          
                          // email
                          InputFieldLabel(text: "Email"),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Your email",
                              hintStyle: TextStyle(color: AppColors.greyOne),
                            ),
                            onChanged: (value) => bloc.add(EmailChanged(value)),
                          ),
                  
                          SizedBox(height: 10),
                          
                          // password
                          InputFieldLabel(text: "Password"),
                          TextFormField(
                            obscureText: !state.isPasswordVisible,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Your password",
                              hintStyle: TextStyle(color: AppColors.greyOne),
                              suffixIcon: IconButton(
                                onPressed: () => bloc.add(TogglePasswordVisibility()),
                                icon: Icon(
                                  state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: AppColors.greyOne,
                                ),
                              ),
                            ),
                            onChanged: (value) => bloc.add(PasswordChanged(value)),
                          ),
                  
                          SizedBox(height: 10),
                          
                          // age selector
                          InputFieldLabel(text: "Age group"),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                            ),
                            items: ['18-25', '26-35', '36-50', '50+']
                            .map((ageGroup) => DropdownMenuItem(value: ageGroup, child: Text(ageGroup))).toList(),
                            onChanged: (value) => bloc.add(AgeGroupChanged(value!)),
                          ),
                  
                          SizedBox(height: 10),
                  
                          InputFieldLabel(text: "Gender"),
                          GenderSelect(onGenderSelected: (gender) => bloc.add(GenderChanged(gender))),
                  
                          SizedBox(height: 10),
                  
                          InputFieldLabel(text: "Interests"),
                          BookInterentSelect(onInterestsChanged: (interests) => bloc.add(InterestsChanged(interests))),

                          SizedBox(height: 10),

                          // register button
                          RoundedButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                context.read<RegisterBloc>().add(ValidateFields());
                                final state = context.read<RegisterBloc>().state;

                                if (_formKey.currentState!.validate()) {
                                  context.read<RegisterBloc>().add(ValidateFields());
                                  final state = context.read<RegisterBloc>().state;

                                  if (state.nameError == null &&
                                      state.emailError == null &&
                                      state.passwordError == null &&
                                      state.ageGroupError == null &&
                                      state.genderError == null &&
                                      state.interestsError == null)
                                  {
                                    context.read<RegisterBloc>().add(SubmitRegistration());
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Error!"),
                                        content: Text([
                                          if (state.nameError != null) state.nameError!,
                                          if (state.emailError != null) state.emailError!,
                                          if (state.passwordError != null) state.passwordError!,
                                          if (state.ageGroupError != null) state.ageGroupError!,
                                          if (state.genderError != null) state.genderError!,
                                          if (state.interestsError != null) state.interestsError!,
                                        ].join("\n")),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text("Ok"),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                            bgColor: AppColors.primary, 
                            textColor: AppColors.white, 
                            text: "Register"
                          ),

                          SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Have an account?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.greyOne)),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()) 
                                  );
                                }, 
                                child: Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary)))
                            ],
                          ),

                          SizedBox(height: 15),

                          Center(
                            child: Column(
                              children: [
                                Text("By clicking Register, you agree to our", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.greyOne)),
                                SizedBox(width: 4),
                                Text("Terms and Privacy Policy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary),),
                              ],
                            ),
                          ),

                          SizedBox(height: 15),
                        
                        ],
                      ),
                    
                    ],
                  ),
                ),
              );
            },
          ),
        ),
),
      ),
    );
  }
}