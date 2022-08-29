//
//  RatioImageView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 23/08/2022.
//

import SwiftUI

struct RatioImageView: View {
    let image: Image
    let heightRatio: CGFloat = 0.5
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                image.resizable().aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height*heightRatio,
                       alignment: .center)
            }
        }
    }
}

struct RatioImageView_Previews: PreviewProvider {
    static var previews: some View {
        RatioImageView(image: Image(systemName: "photo.fill"))
    }
}
