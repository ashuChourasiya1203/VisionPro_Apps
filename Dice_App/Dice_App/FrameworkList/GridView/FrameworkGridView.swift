//
//  FrameworkGridView.swift
//  Dice_App
//
//  Created by Ashutosh Chourasiya on 11/03/24.
//

import SwiftUI

final class FrameworkGridViewModel : ObservableObject {
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
}

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    @State var canNavigate = false
    @State var selecetedFramework : Framework?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid (columns: self.viewModel.columns){
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleViewGrid(framework: framework)
                            .onTapGesture {
                                print("Framework name : \(framework.name)")
                                self.selecetedFramework = framework
                                self.canNavigate = true
                            }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("🍎 App Documents")
            .navigationDestination(isPresented: self.$canNavigate, destination: {
                FrameworkDetailsViewGrid(framework: self.selecetedFramework ?? MockData.sampleFramework)}
            )
        }
        .glassBackgroundEffect(displayMode: .implicit)
    }
}

#Preview(windowStyle:.automatic) {
    FrameworkGridView().preferredColorScheme(.dark)
}
