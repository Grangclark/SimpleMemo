//
//  DetailView.swift
//  SimpleMemo
//
//  Created by 長橋和敏 on 2025/01/18.
//

// 発展的アイデア
// 複数のメモの保存（配列でメモを管理）
// 削除機能（UserDefaultsからメモを削除）

import SwiftUI

struct DetailView: View {
    // メモを保持する状態変数
    @State private var memoText: String = ""
    
    // 初期化時に保存されているメモを取得
    init() {
        // UserDefaultsから以前保存したメモを読み込む
        // memoTextにセット
        // savedMemoに値が存在するか確認
        if let savedMemo = UserDefaults.standard.string(forKey: "savedMemo") {
                // _memoText: @Stateの内部変数で、初期化時に特別な操作をするために使用
                _memoText = State(initialValue: savedMemo)
        }
    }
    
    var body: some View {
        VStack {
            // メモを入力するUITextView（SwiftUIではTextEditorを使用）
            TextEditor(text: $memoText)
                .padding()
                .border(Color.gray, width: 1)
                .frame(height: 200)
            
            // 保存ボタン
            Button(action: saveMemo) {
                Text("保存")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
    
    // メモをUserDefaultsに保存する関数
    func saveMemo() {
        // UserDefaultsにメモを保存
        // savedMemoというキーにmemoTextを保存
        // forKey:: UserDefaultsでデータを保存・取得するときの識別子
        UserDefaults.standard.set(memoText, forKey: "savedMemo")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
