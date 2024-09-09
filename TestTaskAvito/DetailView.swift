//
//  DetailView.swift
//  TestTaskAvito
//
//  Created by Denis Dareuskiy on 9.09.24.
//

import SwiftUI

struct DetailView: View {
    var photo: UnsplashPhoto
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.urls.small)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300) // Высота изображения
            } placeholder: {
                ProgressView()
            }
            .padding()

            Text(photo.description)
                .font(.title)
                .padding()
        }
        .navigationTitle(photo.description)
    }
}

#Preview {
    DetailView(photo: UnsplashPhoto(
        id: "1",
        urls: PhotoURLs(small: "https://example.com/test-image.jpg"),
        description: "Тестовое изображение"
    ))
}
