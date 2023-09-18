//
//  ContentView.swift
//  chat
//
//  Created by Yuki Honda on 2023/09/15.
//

import SwiftUI
import AVFoundation


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
    @State private var textFieldValue = ""
    @State private var messages: [Message] = [
        .init(id: .init(), text: "こんにちは！何か喋って", isMyMessage: false)
    ]
    
    
    struct Message: Identifiable {
        let id: UUID
        let text: String
        let isMyMessage: Bool
    }
    
    var body: some View {
        Button {
            speak(text: "Hello")
        } label: {
            Text("Speak")
        }

//        Background {
//            VStack {
//                ScrollView {
//                    VStack {
//                        ForEach(messages) { message in
//                            messageRow(message)
//                        }
//                    }
//                    .padding()
//                }
//
//                HStack {
//                    TextField("", text: $textFieldValue)
//                        .textFieldStyle(.roundedBorder)
//                        .padding()
//                        .focused($isFocused)
//                    Button {
//                        let newMessage = Message(id: .init(), text: textFieldValue, isMyMessage: true)
//                        messages.append(newMessage)
//                        isFocused = false
//                        speak(text: "Hello, Yuki!")
//
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            let responseMessage = Message(id: .init(), text: "受け取りました！", isMyMessage: false)
//                            messages.append(responseMessage)
//                        }
//
//                    } label: {
//                        Image(systemName: "arrow.up.circle.fill")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(Color.blue)
//                    }
//
//                }
//                .padding(.horizontal)
//            }
//        }
//        .onTapGesture {
//            isFocused = false
//        }
    }
    
    private func messageRow(_ message: Message) -> some View {
        HStack (alignment: .top) {
            if message.isMyMessage {
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
            } else {
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
    
    func speak(text: String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("speak failed: \(error)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: "text")
            utterance.voice = .init(language: "en-US") // 言語を設定する
            utterance.volume = 0.5
            utterance.rate = 0.5
            utterance.pitchMultiplier = 1.2
            synthesizer.speak(utterance)
            print("speak text")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
