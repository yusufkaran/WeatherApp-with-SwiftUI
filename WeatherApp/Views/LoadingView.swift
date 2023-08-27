//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Yusuf Karan on 27.08.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .white))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
