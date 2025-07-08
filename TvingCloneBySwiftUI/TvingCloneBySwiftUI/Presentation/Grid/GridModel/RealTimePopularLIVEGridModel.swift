//
//  RealTimePopularLIVEGridModel.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import Foundation

struct RealTimePopularLIVEGridModel {
    let id: UUID = UUID()
    let image: String
    let count: String
    let name: String
    let episodes: String
    let rating: String
}
extension RealTimePopularLIVEGridModel {
    static func dummy() -> [RealTimePopularLIVEGridModel] {
        return [
            RealTimePopularLIVEGridModel(image: "drama 1", count: "1", name: "환승연애3", episodes: "99화", rating: "27.2%"),
            RealTimePopularLIVEGridModel(image: "drama 2", count: "2", name: "별들에게 물어봐", episodes: "1화", rating: "4.2%"),
            RealTimePopularLIVEGridModel(image: "drama 3", count: "3", name: "선재 업고 튀어", episodes: "45화", rating: "0%"),
            RealTimePopularLIVEGridModel(image: "drama 4", count: "4", name: "지구오락실2", episodes: "12화", rating: "7.8%"),
            RealTimePopularLIVEGridModel(image: "drama 5", count: "5", name: "언젠가는 슬기로운 전공의생활", episodes: "98화", rating: "57.2%")
        ]
    }
}
