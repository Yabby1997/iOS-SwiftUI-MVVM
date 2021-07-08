//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Seunghun Yang on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear(perform: {
            self.viewModel.getUsers()
        })
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let apiService = APIService()
        
        func getUsers() {
            apiService.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ContentView.ViewModel()
        viewModel.users = [
            User(id: 1, name: "dummy")
        ]
        
        return ContentView(viewModel: viewModel)
    }
}
