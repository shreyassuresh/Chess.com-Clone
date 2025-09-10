import SwiftUI

struct PlayBotsLandingView: View {
    @ObservedObject var router: NavigationRouter
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer()
                
                VStack(spacing: 16) {
                    Text("Play the bots")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Challenge a bot to a chess game. Choose from beginner to master.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    BulletPoint(text: "Choose from 25+ bots with different personalities")
                    BulletPoint(text: "Play at your own pace with adaptive difficulty")
                    BulletPoint(text: "Learn from detailed game analysis")
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    router.navigate(to: .botSelection)
                }) {
                    Text("Start")
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

struct BulletPoint: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(Color(hex: "81B64C"))
                .frame(width: 6, height: 6)
                .padding(.top, 8)
            
            Text(text)
                .foregroundColor(.white)
                .font(.body)
            
            Spacer()
        }
    }
}