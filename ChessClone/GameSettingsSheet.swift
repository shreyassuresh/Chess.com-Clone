import SwiftUI

struct GameSettingsSheet: View {
    @Binding var isPresented: Bool
    @State private var selectedPieces = "Neo"
    @State private var selectedBoard = "Green"
    @State private var coordinatesPosition = "Inside"
    @State private var showMoveHints = true
    @State private var soundEnabled = true
    
    let pieceOptions = ["Neo", "Classic", "Modern", "Wood"]
    let boardOptions = ["Green", "Brown", "Blue", "Purple"]
    let coordinateOptions = ["Inside", "Outside", "Hidden"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "302E2B")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    List {
                        SettingsRow(title: "Pieces", value: selectedPieces) {
                            // Show pieces picker
                        }
                        
                        SettingsRow(title: "Board", value: selectedBoard) {
                            // Show board picker
                        }
                        
                        SettingsRow(title: "Coordinates", value: coordinatesPosition) {
                            // Show coordinates picker
                        }
                        
                        HStack {
                            Text("Move Hints")
                                .foregroundColor(.white)
                            Spacer()
                            Toggle("", isOn: $showMoveHints)
                                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "81B64C")))
                        }
                        .listRowBackground(Color.clear)
                        
                        HStack {
                            Text("Sound")
                                .foregroundColor(.white)
                            Spacer()
                            Toggle("", isOn: $soundEnabled)
                                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "81B64C")))
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    
                    // Bottom buttons
                    HStack(spacing: 16) {
                        Button("Cancel") {
                            isPresented = false
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                        
                        Button("Save") {
                            // Save settings
                            isPresented = false
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "81B64C"))
                        .cornerRadius(12)
                    }
                    .padding()
                }
            }
            .navigationTitle("Game Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(hex: "302E2B"), for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct SettingsRow: View {
    let title: String
    let value: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                Spacer()
                Text(value)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .listRowBackground(Color.clear)
    }
}