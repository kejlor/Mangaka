//
//  AddMangaView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import SwiftUI

struct AddMangaView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: AddMangaViewModel
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    init(vm: AddMangaViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            VStack {
                HStack {
                    Text("Title")
                    TextField("Enter manga title", text: $vm.title)
                }
                
                HStack {
                    Text("Description")
                    TextField("Enter manga description", text: $vm.terse)
                }
                
                HStack {
                    Text("Favourite")
                    Button {
                        vm.favourite.toggle()
                    } label: {
                        Image(systemName: vm.favourite ? "heart.filled" : "heart")
                            .foregroundColor(.red)
                    }

                }
                
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
            }
            .padding()
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            
            Button("Save") {
                vm.content = inputImage
                vm.save()
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

extension AddMangaView {
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct AddMangaView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistantContainer.viewContext
        
        AddMangaView(vm: AddMangaViewModel(context: viewContext))
    }
}
