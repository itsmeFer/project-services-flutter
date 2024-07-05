import 'package:app_car/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Silahkan buat akun Anda!',
                        
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    // hintText: 'user@gmail.com',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    filled: true
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    // hintText: 'user@gmail.com',
                     border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    filled: true
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                     border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    filled: true,
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text('Lupa sandi?'),
                //   ),
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buat Akun',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40), 
                    backgroundColor: Colors.green, 
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah punya akun?',
                            
                            style: TextStyle(fontSize: 16, color: Colors.grey[500],fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(
                            'Masuk',
                            
                            style: 
                            TextStyle(fontSize: 16, color: Colors.green,fontWeight: FontWeight.w700),
                            
                            textAlign: TextAlign.center,
                          ),
                          )
                        ],
                      ),
                    ),
                // SizedBox(height: 20),
                // Text('atau'),
                // TextButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Buat akun ? Registrasi disini.',
                //     style: TextStyle(color: Colors.green),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
