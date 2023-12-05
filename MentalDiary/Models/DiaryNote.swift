//
//  DiaryNote.swift
//  MentalDiary
//
//  Created by Danil Frolov on 05.12.2023.
//

import Foundation
import SwiftData

@Model
class NoteModel {
    @Attribute(.unique) var id: UUID
    let mentalHealthRate: Int
    let situation: String
    let thoughts: String
    let feel: String
    let date: Date
    
    init(mentalHealthRate: Int, situation: String, thoughts: String, feel: String, date: Date) {
        self.id = UUID()
        self.mentalHealthRate = mentalHealthRate
        self.situation = situation
        self.thoughts = thoughts
        self.feel = feel
        self.date = date
    }
}

