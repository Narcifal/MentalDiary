//
//  Emotion.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit

typealias EmotionGroup = (title: String, image: ImageAsset.Image, color: UIColor)

fileprivate enum EmotionConstant {
    static let titles = [
        "I am angry! >:(",
        "I am sad :(",
        "I'm disgusted :&",
        "I am scared D:",
        "I am happy! :D",
        "I am surprised :O"
    ]

    static let emotions: [ImageAsset.Image] = [
        Asset.angryEmotion.image,
        Asset.sadEmotion.image,
        Asset.disgustEmotion.image,
        Asset.fearEmotion.image,
        Asset.happyEmotion.image,
        Asset.surpriseEmotion.image
    ]

    static let colors: [UIColor] = [
        .systemRed, .lightGray, .brown, .blue, Asset.pureGreen.color, .systemYellow
    ]
}

enum Emotion {
    case state(index: Int)

    var getState: EmotionGroup {
        switch self {
        case .state(let index):
            guard index >= 0 && index < EmotionConstant.titles.count else {
                return (title: "Ooops..", image: EmotionConstant.emotions[4], color: .clear)
            }

            return (title: EmotionConstant.titles[index], image: EmotionConstant.emotions[index], color: EmotionConstant.colors[index])
        }
    }
}
