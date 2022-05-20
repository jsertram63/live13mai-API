//
//  ContentView.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import SwiftUI







struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todos, id:\.self){ todo in
                    HStack{
                        Image(systemName: "square.and.pencil")
                            .frame(width: 60, height: 60)
                        Text(todo.title)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("API")
        .onAppear {
            viewModel.fetch()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
