//
//  FrameworkListView.swift
//  Apple_Framework_App
//
//  Created by Ashutosh Chourasiya on 06/03/24.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailsView(
                        framework: framework,
                        isShowingDetailView: self.$viewModel.isShowingDetailView)
                    ){
                        FrameworkTitleView(framework: framework,size: 150)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
        }
        .padding()
        .scrollIndicators(.hidden)
        .scrollContentBackground(.hidden)
        .navigationTitle("🍎 Framework")
    }
}

#Preview(windowStyle: .automatic) {
    FrameworkListView().preferredColorScheme(.dark)
}
