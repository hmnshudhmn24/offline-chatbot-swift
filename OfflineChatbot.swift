import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var currentInput: String = ""

    init() {
        messages.append(ChatMessage(text: "Hi! I'm your offline chatbot 🤖. How can I help you today?", isUser: false))
    }

    func sendMessage() {
        let input = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !input.isEmpty else { return }

        let userMessage = ChatMessage(text: input, isUser: true)
        messages.append(userMessage)
        currentInput = ""

        respondTo(input: input)
    }

    private func respondTo(input: String) {
        let response = OfflineBot.response(for: input)
        let botMessage = ChatMessage(text: response, isUser: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.messages.append(botMessage)
        }
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ContentView: View {
    @StateObject var viewModel = ChatViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Color.blue.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                        .padding(.top, 4)
                    }
                }

                HStack {
                    TextField("Type your message...", text: $viewModel.currentInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .frame(minHeight: 30)

                    Button("Send") {
                        viewModel.sendMessage()
                    }
                    .padding(.trailing)
                }
                .padding(.bottom)
            }
            .navigationTitle("Offline Chatbot")
        }
    }
}

@main
struct OfflineChatbotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct OfflineBot {
    static func response(for input: String) -> String {
        let lowerInput = input.lowercased()
        if lowerInput.contains("hello") || lowerInput.contains("hi") {
            return "Hey there! 👋"
        } else if lowerInput.contains("how are you") {
            return "I'm just code, but I’m running great! 💻"
        } else if lowerInput.contains("weather") {
            return "I can't access real-time weather, but I hope it's sunny! ☀️"
        } else if lowerInput.contains("bye") {
            return "Goodbye! Take care 👋"
        } else if lowerInput.contains("your name") {
            return "I'm an offline Swift Chatbot!"
        } else if lowerInput.contains("joke") {
            return "Why did the developer go broke? Because they used up all their cache. 😄"
        } else {
            return "I'm not sure how to respond to that. Try asking something else!"
        }
    }
}

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var currentInput: String = ""

    init() {
        messages.append(ChatMessage(text: "Hi! I'm your offline chatbot 🤖. How can I help you today?", isUser: false))
    }

    func sendMessage() {
        let input = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !input.isEmpty else { return }

        let userMessage = ChatMessage(text: input, isUser: true)
        messages.append(userMessage)
        currentInput = ""

        respondTo(input: input)
    }

    private func respondTo(input: String) {
        let response = OfflineBot.response(for: input)
        let botMessage = ChatMessage(text: response, isUser: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.messages.append(botMessage)
        }
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ContentView: View {
    @StateObject var viewModel = ChatViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Color.blue.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                        .padding(.top, 4)
                    }
                }

                HStack {
                    TextField("Type your message...", text: $viewModel.currentInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .frame(minHeight: 30)

                    Button("Send") {
                        viewModel.sendMessage()
                    }
                    .padding(.trailing)
                }
                .padding(.bottom)
            }
            .navigationTitle("Offline Chatbot")
        }
    }
}

@main
struct OfflineChatbotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct OfflineBot {
    static func response(for input: String) -> String {
        let lowerInput = input.lowercased()
        if lowerInput.contains("hello") || lowerInput.contains("hi") {
            return "Hey there! 👋"
        } else if lowerInput.contains("how are you") {
            return "I'm just code, but I’m running great! 💻"
        } else if lowerInput.contains("weather") {
            return "I can't access real-time weather, but I hope it's sunny! ☀️"
        } else if lowerInput.contains("bye") {
            return "Goodbye! Take care 👋"
        } else if lowerInput.contains("your name") {
            return "I'm an offline Swift Chatbot!"
        } else if lowerInput.contains("joke") {
            return "Why did the developer go broke? Because they used up all their cache. 😄"
        } else {
            return "I'm not sure how to respond to that. Try asking something else!"
        }
    }
}