//
//  SearchView.swift
//  TestTaskAvito
//
//  Created by Denis Dareuskiy on 9.09.24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var filteredPhotos: [UnsplashPhoto] = MOCK_DATA
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Поиск фильмов", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: searchText) { newValue in
                            filterPhotos()
                        }
                    
                    // Результаты поиска
                    LazyVStack(spacing: 12) {
                        ForEach(filteredPhotos) { photo in
                            NavigationLink(destination: DetailView(photo: photo)) {
                                Text(photo.description)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading) // Выравнивание по левому краю
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 3)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Поиск")
        }
    }
    
    // Фильтрация фотографий
    private func filterPhotos() {
        if searchText.isEmpty {
            filteredPhotos = MOCK_DATA
        } else {
            filteredPhotos = MOCK_DATA.filter { photo in
                photo.description.lowercased().contains(searchText.lowercased())
            }
        }
    }
}


#Preview {
    SearchView()
}
