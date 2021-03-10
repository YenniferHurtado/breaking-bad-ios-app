//
//  ViewModelCollectioView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public class EpisodeViewModel {
    
    var view: CollectionViewProtocol?
    var episodeModel = [EpisodeModel]()
    var repository = RepositoryViewModel()
    
}

// MARK: - RESULT OBSERVABLE EPISODE DATA

extension EpisodeViewModel {
    
    func getDataEpisodes() {
        let observable = repository.movieDataEpisodes()
            observable
                .observeOn(MainScheduler.instance)
                .subscribe(
                    onNext: onNext(),
                    onError: onError(),
                    onCompleted: onComplete(),
                    onDisposed: onDisposed()
        )
    }
    
    func onNext()->([EpisodeModel])->Void {
            
        let onNext: ([EpisodeModel])->Void = { response  in
            self.episodeModel = response
            self.view?.listEpisodes()
        }
        return onNext
    }
    
    func onError()->(Error)->Void {
        
        let onError:(Error)->Void = { error in
            
        }
        return onError
    }
    
    func onComplete()-> ()-> Void {
        let onCompleted:()->Void = {
            
        }
        return onCompleted
    }
    
    func onDisposed()-> ()-> Void {
        let onDisposed:()->Void = {
            
        }
        return onDisposed
    }
}
