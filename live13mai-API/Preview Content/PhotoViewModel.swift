//
//  PhotoViewModel.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import SwiftUI


class PhotoViewModel : ObservableObject {
    @Published var photos : [Photo] = []
    
    
    func fetch(){
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        ///// si le guard a reussi on passe à la ligne suivante apres l'accolade
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    self?.photos = photos
                }
            }
            catch {
            }
        }
        task.resume()
    }
}
