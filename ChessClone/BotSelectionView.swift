import SwiftUI

struct BotSelectionView: View {
    @ObservedObject var router: NavigationRouter
    @State private var selectedBot = ChessBot(
        name: "ChessGPT",
        eloRating: 249,
        description: "An AI-powered chess bot that adapts to your playing style and provides helpful hints.",
        tags: ["BEST OF 2025", "ADAPTIVE", "BEGINNER"],
        avatar: "robot"
    )
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        router.navigateBack()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    Text("shahil33 (800)")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                    
                    Spacer().frame(width: 30)
                }
                .padding()
                
                Text("Play vs...")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                // Bot Card
                VStack(spacing: 20) {
                    VStack(spacing: 16) {
                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color(hex: "81B64C"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(spacing: 8) {
                            Text("\(selectedBot.name) (\(selectedBot.eloRating))")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(selectedBot.description)
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        
                        // Tags
                        HStack(spacing: 8) {
                            ForEach(selectedBot.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color(hex: "81B64C"))
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(16)
                    .padding(.horizontal)
                }
                
                Spacer()
                
                Button(action: {
                    router.navigate(to: .preGameLobby(selectedBot))
                }) {
                    Text("Choose")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "81B64C"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}