import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.8
    @State private var logoOpacity: Double = 0.5
    
    var body: some View {
        if isActive {
            ChessLoginView()
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("logochess")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                    
//                    Text("Chess.com")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .opacity(logoOpacity)
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2)) {
                    logoScale = 1.0
                    logoOpacity = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isActive = true
                    }
                }
            }
        }
    }
}
