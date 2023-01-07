import 'package:equatable/equatable.dart';


import '../../data/models/product_data_model.dart';

class UserParameter extends Equatable{
   final String name ;
   final  String email;
   final String password;


   UserParameter({
     required this.name,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,password];

}

class IdParameter extends Equatable{
  final int id;

  const IdParameter({required this.id});


  @override
  List<Object?> get props => [
    id
  ];
}
String? uId;
