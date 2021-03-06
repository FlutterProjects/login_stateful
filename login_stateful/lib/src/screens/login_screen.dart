import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget 
{
	createState() 
	{
		return(LoginScreenState());
	}
}

class LoginScreenState extends State<LoginScreen>  with ValidationMixin
{
	final formKey = GlobalKey<FormState>();

	String email = "";
	String password = "";

	Widget build(context)
	{
		return Container 
		(
			margin: EdgeInsets.all(50.0),
			child: Form 
			(
				key: formKey,
				child: Column 
				(
					children: 
					[
						Container(margin: EdgeInsets.only(bottom: 55.0)),
						Text
						(
							"Login",							
							style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
						),
						Container(margin: EdgeInsets.only(bottom: 25.0)),
						emailField(),
						Container(margin: EdgeInsets.only(bottom: 10.0)),
						passwordField(),
						Container(margin: EdgeInsets.only(bottom: 25.0)),
						submitButton()
					],
				),
			)
		);
	}

	Widget emailField() 
	{
		return TextFormField 
		(
			keyboardType: TextInputType.emailAddress,
			decoration: InputDecoration 
			(
				labelText: "Email Address",
				hintText: "you@example.com"
			),
			validator: validateEmail,
			onSaved: (String value) 
			{
				email = value;
			},
		);
	}

	Widget passwordField()
	{
		return TextFormField 
		(
			obscureText: true,
			decoration: InputDecoration 
			(
				labelText: "Password",
				hintText: "Password"
			),
			validator: validatePassword,
			onSaved: (String value) 
			{
				password = value;
			},
		);
	}

	Widget submitButton() 
	{
		return RaisedButton 
		(
			color: Colors.blue,
			child: Text
			(
				"Submit",
				style: TextStyle(fontSize: 20, color: Colors.white),
			),
			onPressed: () 
			{
				if (formKey.currentState.validate())
				{
					formKey.currentState.save();
					print("Posting $email and $password");
				}
			},
		);
	}
}