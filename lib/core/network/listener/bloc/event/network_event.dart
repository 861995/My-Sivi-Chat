import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckNetworkStatus extends NetworkEvent {}
