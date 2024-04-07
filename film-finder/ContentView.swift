//
//  ContentView.swift
//  film-finder
//
//  Created by Cameron Small on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var selectedIndex = 0
    let dataSource = ["Apple", "Mango", "Orange", "Banana", "Kiwi", "Watermelon"]
    
    let actionClosure = { (action: UIAction) in
         print(action.title)
    }
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(alignment: .top, content: {
                Image(systemName: "movieclapper.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("FILM FINDER")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 200.0, height: 25.0)
                Image(systemName: "movieclapper.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            })
            
            Text("Choose a genre")
                .font(.title)
                .frame(width: 300.0, height: 25.0)
            Menu {
                Button {
                    
                } label: {
                    Text("Open cache directory")
                }
                .help("Show application support folder")
                Button {
                    
                } label: {
                    Text("Clear cache")
                }
                .help("Clears all content from the cache")
            } label: {
                Text(dataSource[selectedIndex])
                Image(systemName: "chevron.down")
            }
            .buttonStyle(.borderedProminent)
            .tint(.secondary)
            .controlSize(.regular)
            .cornerRadius(5)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            
            Button(action: {
                
            }, label: {
                Text("Let's Play")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 140.0, height: 25.0)
            })
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .controlSize(.extraLarge)
            .cornerRadius(20)
            
            .padding()
            
            Text("Movie Title")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 25.0)
            
            Image(systemName: "popcorn.fill")
            Text("Movie description")
                
            HStack(content: {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "hand.thumbsup.fill")
                })
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.regular)
                .cornerRadius(5)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "hand.thumbsdown.fill")
                })
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .controlSize(.regular)
                .cornerRadius(5)
            })
        })
    }
}

#Preview {
    ContentView()
}
