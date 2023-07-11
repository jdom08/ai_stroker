//
//  ContentView.swift
//  AIStroker Watch App
//
//  Created by Dominguez, Jason on 7/11/23.
//

import SwiftUI
import Combine
import Foundation



let par_list: [Int] = [4, 4, 5, 4, 5, 3, 4, 3, 4, 5, 3, 4, 3, 5, 5, 4, 3, 4]

class CounterViewModel: ObservableObject {
    @Published var count = 0
    @Published var hole_count = 1
    @Published var score = 0
    
    func increment_hole() {
        hole_count += 1
        score += count
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        if count > 0 {
            count -= 1
        }
    }
}


struct ContentView: View {
    @ObservedObject var viewModel = CounterViewModel()
    var body: some View {
        let par_hole = viewModel.hole_count - 1
        let par_count = par_list[par_hole]
        let score_count = viewModel.count
            VStack {
                Text("Hole \(viewModel.hole_count) Par \(par_count)")
                Text("Strokes \(viewModel.count)")
                    .font(.title)
                
                HStack {
                    Button(action: {
                        viewModel.increment()
                    }) {
                        Image(systemName: "arrow.up.circle")
                            .font(.largeTitle)
                    }
                    
                    Button(action: {
                        viewModel.decrement()
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .font(.largeTitle)
                    }
                }
                Button(action: {
                    self.submit()
                }) {
                    Text("Submit")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                }
                Text("Score \(viewModel.score)")
            }
        }
        func submit() {
            viewModel.increment_hole()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
