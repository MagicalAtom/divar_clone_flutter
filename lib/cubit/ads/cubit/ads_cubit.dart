import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/data/repositories/ads/ads_repository_interface.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  
   

      AdsRepositoryInterFace adsRepository;
  AdsCubit(this.adsRepository) : super(AdsInitial());


  Future<void>  getItems(page,PagingController controller) async {
  try{
    var newitems = await adsRepository.getAllAds(page);
    final isLastPage = newitems.length < 15;
    if(isLastPage){
       controller.appendLastPage(newitems);
    } else {
      final nextPage = page+1;
      controller.appendPage(newitems, nextPage);
    } 
    
  } catch(e) {
    print(e);
    controller.error = e;
  }   
  }




}
