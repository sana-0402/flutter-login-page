import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override 
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 16));
    _topAlignmentAnimation = TweenSequence<Alignment> (
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4,
        ),
      ],
    ) .animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment> (
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4,
        ),

      ],
    ) .animate(_controller);

    _controller.repeat();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build (BuildContext context) {
    return Container(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context,_) {        
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: _topAlignmentAnimation.value,
          end: _bottomAlignmentAnimation.value,
          colors: [
            Color.fromARGB(255, 137, 197, 231),
            Color.fromARGB(255, 88, 146, 205),
            Color.fromARGB(255, 44, 101, 170),
            Color.fromARGB(255, 18, 69, 136),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
      );
   })
  );}

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             _crisLogo(),
            const SizedBox(height: 25),
            _icon(),
            const SizedBox(height: 25),
            _inputField("Employee id", usernameController),
            const SizedBox(height: 20),
           _inputField("password", passwordController, isPassword: true),
            const SizedBox(height: 25),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
           
          ],
        ),
      ),
    );

  }

   Widget _crisLogo(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2),
        shape: BoxShape.rectangle
      ),
      child: Image(
        image: AssetImage('assets/icons/Logo_White.png'),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle),
        child: const Icon(Icons.person, color: Colors.white, size: 60),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller, {
    isPassword = false}) {
    
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );
    
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword, 
    );
  }
  Widget _loginBtn(){
    return ElevatedButton(
      onPressed: (){
        debugPrint("Username: " + usernameController.text);
        debugPrint("Password: " + passwordController.text);
      }, 
      child: const SizedBox(
        width: double.infinity,
        child: Text(
         "Sign in  ",
         textAlign: TextAlign.center,
         style: TextStyle(fontSize: 20),
        )),      
     style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      primary:  Color.fromARGB(255, 228, 226, 226),
      onPrimary: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 16),

      ),
    );
  }
  Widget _extraText(){
    return const Text("Can't access your account?", 
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16, color: Colors.white),
    );

  }

 




}