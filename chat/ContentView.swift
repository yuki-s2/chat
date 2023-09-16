//
//  ContentView.swift
//  chat
//
//  Created by Yuki Honda on 2023/09/15.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var isFocused: Bool
    @State private var name = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack(alignment: .top) {
                        Circle()
                            .frame(width: 40, height: 40)
                        Text("Hello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, Swiftfffffffffffffffffffffffffffffffff")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240)
                            .background (
                                Rectangle()
                                    .cornerRadius(10)
                            )
                        Spacer()
                    }
                    HStack (alignment: .top) {
                        Spacer()
                        Text("Hello, Swift.cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10)(alignment: .top)(alignment: .top)")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240)
                            .background (
                                Rectangle()
                                    .cornerRadius(10)
                            )
                        Circle()
                            .frame(width: 40, height: 40)
                        
                    }
                    HStack(alignment: .top) {
                        Circle()
                            .frame(width: 40, height: 40)
                        Text("Hello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, SwiftHello, Swiftfffffffffffffffffffffffffffffffff")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240)
                            .background (
                                Rectangle()
                                    .cornerRadius(10)
                            )
                        Spacer()
                    }
                    HStack (alignment: .top) {
                        Spacer()
                        Text("Hello, Swift.cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10).cornerRadius(10)(alignment: .top)(alignment: .top)")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240)
                            .background (
                                Rectangle()
                                    .cornerRadius(10)
                            )
                        Circle()
                            .frame(width: 40, height: 40)
                        
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("あなたの名前", text: $name)
                    .padding()
                    .focused($isFocused)
                Button {
                    print("\(name)を送信しました")
                    isFocused = false
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.blue)
                }

            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
