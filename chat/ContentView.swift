//
//  ContentView.swift
//  chat
//
//  Created by Yuki Honda on 2023/09/15.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .overlay(content)
    }
}

struct ContentView: View {
    @FocusState private var isFocused: Bool
    @State private var name = ""
    @State private var messages: [Message] = [.init(id: .init(), text: "こんにちは！何か喋って", isMyMessage: false)]
    
    struct Message: Identifiable {
        let id: UUID
        let text: String
        let isMyMessage: Bool
    }
    
    var body: some View {
        Background {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(messages) { message in
                            if message.isMyMessage {
                                HStack (alignment: .top) {
                                    Spacer()
                                    Text(message.text)
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
                            } else {
                                HStack(alignment: .top) {
                                    Circle()
                                        .frame(width: 40, height: 40)
                                    Text(message.text)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 240)
                                        .background (
                                            Rectangle()
                                                .cornerRadius(10)
                                        )
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                HStack {
                    TextField("あなたの名前", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {   // ⬅︎  クロージャ内の処理を実行

                            print("入力された値: \($name)")
                            
                        } // onSubmit
                        .focused($isFocused)
                    Button {
                        print("\(name)を送信しました")
                        let newMessage = Message(id: .init(), text: name, isMyMessage: true)
                        messages.append(newMessage)
                        isFocused = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let responseMessage = Message(id: .init(), text: "受け取りました！", isMyMessage: false)
                            messages.append(responseMessage)
                        }
                        
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
        .onTapGesture {
            isFocused = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
