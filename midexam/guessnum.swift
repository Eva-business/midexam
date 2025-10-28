import SwiftUI

struct GuessNumberGame: View {
    @State private var target = Int.random(in: 1...100)
    @State private var guess = ""
    @State private var message = ""
    @State private var score = 0
    @State private var attempts = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("猜數字遊戲")
                .font(.largeTitle)
                .padding()

            Text("得分：\(score)")
                .font(.title2)

            TextField("請輸入 1~100", text: $guess)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("猜！") {
                checkGuess()
            }
            .buttonStyle(.borderedProminent)

            Text(message)
                .font(.title3)
                .foregroundColor(.blue)
                .padding()
            
            Button("重新開始") {
                resetGame()
            }
        }
        .padding()
    }

    func checkGuess() {
        guard let number = Int(guess) else {
            message = "請輸入數字！"
            return
        }
        attempts += 1
        if number == target {
            message = "🎉 恭喜你猜對了！你總共猜了 \(attempts) 次"
            score += 1
            //若是猜對了顯示attempts
            
            resetGame()
        } else if number < target {
            message = "太小了，再試試！"
        } else {
            message = "太大了，再試試！"
        }
    }

    func resetGame() {
        target = Int.random(in: 1...100)
        guess = ""
        attempts = 0
    }
}
