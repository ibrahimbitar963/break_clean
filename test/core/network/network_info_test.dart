import 'package:break_clean/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDataConnectionChecker extends Mock implements InternetConnectionChecker {}
void main(){
  MockDataConnectionChecker? mockDataConnectionChecker  ;
  NetworkInfoImpl? networkInfoImpl;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker!);
    });
  
  group('is connected', (){
    test('should forward the call to data connection checker', ()async*{
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker?.hasConnection).
      thenAnswer((_) => tHasConnectionFuture);


      final result = networkInfoImpl?.isConnected;
      verify(mockDataConnectionChecker?.hasConnection);
      expect(result, tHasConnectionFuture);

    });
  });
}