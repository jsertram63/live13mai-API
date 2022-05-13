//
//  PhotoContentView.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import SwiftUI


struct URLImage: View {
    let urlString:String
    
    @State var data:Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage:uiimage)
                .resizable()
                .frame(width: 130, height: 70)
                .aspectRatio( contentMode: .fill)
                .background(Color.gray)
        }else  {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 130, height: 70)
                .aspectRatio( contentMode: .fill)
                .background(Color.gray)
                .onAppear {
                    fetchData()
               }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            self.data = data
        }
        task.resume()
    }
    
}

struct PhotoContentView: View {
    
    @StateObject var viewModel = PhotoViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.photos , id:\.self){ photo in
                    HStack {
                        URLImage(urlString: photo.url)
                        Text(photo.title)
                    }
                    .padding(3)
                }
                
            }
            .navigationTitle("Photo API")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct PhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoContentView()
    }
}
