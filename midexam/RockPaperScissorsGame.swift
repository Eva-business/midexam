
//struct ContentView: View {
//var body: some View {
//   RockPaperScissorsGame()
//}
//}
//
import SwiftUI
struct RockPaperScissorsGame: View {
    // 定義出拳選項
    let choices = ["✌️", "✊", "🖐️"]
    // 玩家和電腦的選擇
    //@State：是 SwiftUI 的屬性包裝器，用來標記會改變、且改變時要更新 UI 的值。
    @State private var playerChoice = ""
    @State private var computerChoice = ""
    // 遊戲結果
    @State private var result = ""
    // 玩家得分
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("猜拳遊戲")
                .font(.largeTitle)
                .padding()
            
            Text("得分: \(score)")
                .font(.title2)
            
            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { choice in
                    Button(action: {
                        play(choice)
                    }) {
                        Text(choice)
                            .font(.system(size: 50))
                    }
                }
            }
            .padding()
            
            if !playerChoice.isEmpty {
                VStack(spacing: 10) {
                    Text("你的選擇: \(playerChoice)")
                    Text("電腦的選擇: \(computerChoice)")
                    Text(result)
                        .font(.title2)
                        .foregroundColor(result.contains("贏") ? .green :
                                       result.contains("輸") ? .red : .blue)
                }
                .padding()
            }
        }
    }
    
    func play(_ playerChoice: String) {
        self.playerChoice = playerChoice
        // 電腦隨機選擇
        self.computerChoice = choices.randomElement() ?? ""
        
        // 判斷勝負
        if playerChoice == computerChoice {
            result = "平手！"
        } else if (playerChoice == "✌️" && computerChoice == "🖐️") ||
                  (playerChoice == "✊" && computerChoice == "✌️") ||
                  (playerChoice == "🖐️" && computerChoice == "✊") {
            result = "你贏了！"
            score += 1
        } else {
            result = "你輸了！"
            score -= 1
        }
    }
    
}
