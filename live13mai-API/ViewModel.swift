//
//  ViewModel.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import SwiftUI



class ViewModel : ObservableObject {
    
    @Published var todos : [Todo] = []
    
    func fetch() {
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error ==  nil else {
                return
            }
            do {
                
                // Decodage du JSON et création d'un tableau de todos
                let todos = try  JSONDecoder().decode([Todo].self, from: data)
                DispatchQueue.main.async {
                    self?.todos = todos;
                }
                
            }
            catch {
                
            }
        
        }
        task.resume()
      
        
        
    }
    
}
