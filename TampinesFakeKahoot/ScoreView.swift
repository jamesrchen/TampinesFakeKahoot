//
//  ScoreView.swift
//  TampinesFakeKahoot
//
//  Created by James Chen on 5/6/21.
//

import Foundation
import SwiftUI

struct ScoreView: View {
    var score: Int
    var totalQuestions: Int
    
    
    var body: some View {
        VStack {
            Text("Scoree isss:")
                .padding(0.1)
            Text("\(score)/\(totalQuestions)")
        }
    }
    
    struct ScoreView_Previews: PreviewProvider {
        static var previews: some View {
            ScoreView(score: 2, totalQuestions: 3)
        }
    }
}
