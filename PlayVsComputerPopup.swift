//struct PlayVsComputerPopup: View {
//    @Binding var isPresented: Bool
//    
//    @State private var selectedColor: PlayerColor = .white
//    @State private var selectedMode: GameMode = .friendly
//    
//    enum PlayerColor: String, CaseIterable {
//        case white = "White"
//        case random = "Random"
//        case black = "Black"
//        
//        var icon: String {
//            switch self {
//            case .white: return "♔"
//            case .random: return "A"
//            case .black: return "♚"
//            }
//        }
//    }
//    
//    enum GameMode: String, CaseIterable {
//        case challenge = "Challenge"
//        case friendly = "Friendly"
//        case assisted = "Assisted"
//        case custom = "Custom"
//        
//        var description: String {
//            switch self {
//            case .challenge: return "No help of any kind"
//            case .friendly: return "Hints & takebacks allowed"
//            case .assisted: return "All the tools available"
//            case .custom: return "Choose the settings you want"
//            }
//        }
//    }
//    
//    var body: some View {
//        ZStack {
//            Color.black.opacity(0.6)
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    isPresented = false
//                }
//            
//            VStack(spacing: 20) {
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        isPresented = false
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.title)
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.top, 10)
//                    .padding(.trailing, 10)
//                }
//                
//                Text("Play vs...")
//                    .font(.largeTitle)
//                    .bold()
//                
//                VStack {
//                    Image(systemName: "person.crop.circle.fill")
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(.blue)
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 16))
//                    
//                    HStack(spacing: 4) {
//                        Text("Sven")
//                            .font(.title2)
//                            .bold()
//                        Text("(1100)")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                        Image(systemName: "flag.fill")
//                            .foregroundColor(.red)
//                    }
//                }
//                
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("I PLAY AS")
//                        .font(.headline)
//                    
//                    HStack(spacing: 12) {
//                        ForEach(PlayerColor.allCases, id: \.self) { color in
//                            Button(action: {
//                                selectedColor = color
//                            }) {
//                                Text(color.icon)
//                                    .font(.largeTitle)
//                                    .frame(width: 60, height: 60)
//                                    .background(selectedColor == color ? Color.green.opacity(0.7) : Color.gray.opacity(0.3))
//                                    .foregroundColor(selectedColor == color ? .white : .black)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                            }
//                        }
//                    }
//                }
//                
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("MODE")
//                        .font(.headline)
//                    
//                    ForEach(GameMode.allCases, id: \.self) { mode in
//                        Button(action: {
//                            selectedMode = mode
//                        }) {
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(mode.rawValue)
//                                        .bold()
//                                    Text(mode.description)
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                }
//                                Spacer()
//                                HStack(spacing: 2) {
//                                    ForEach(0..<3) { _ in
//                                        Image(systemName: "crown.fill")
//                                            .foregroundColor(.yellow)
//                                    }
//                                }
//                            }
//                            .padding()
//                            .background(selectedMode == mode ? Color.green.opacity(0.7) : Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                        }
//                    }
//                }
//                
//                Button(action: {
//                    print("Play tapped with color: \(selectedColor.rawValue), mode: \(selectedMode.rawValue)")
//                    isPresented = false
//                }) {
//                    Text("Play")
//                        .font(.title2)
//                        .bold()
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(16)
//                }
//            }
//            .padding()
//            .background(Color(UIColor.systemBackground))
//            .cornerRadius(20)
//            .padding(.horizontal, 30)
//            .shadow(radius: 20)
//        }
//    }
//}
