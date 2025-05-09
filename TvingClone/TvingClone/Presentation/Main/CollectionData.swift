//
//  CollectionData.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import Foundation
import UIKit

struct TodayTvingData {
    var image: UIImage
    var count: String
}

struct PopularityLiveData {
    var image: UIImage
    var count: String
    var name: String
    var episodes: String
    var rating: String
}

struct PopularityMovieData {
    var image: UIImage
}

struct BaseballData {
    var image: UIImage
}

struct TvData {
    var image: UIImage
}

struct Best5Data {
    var image: UIImage
}

// MARK: - Dummy Data
extension TodayTvingData {
    static func dummy() -> [TodayTvingData] {
        return [
            TodayTvingData(image: .movie1, count: "1"),
            TodayTvingData(image: .movie2, count: "2"),
            TodayTvingData(image: .movie3, count: "3"),
            TodayTvingData(image: .movie4, count: "4"),
            TodayTvingData(image: .movie5, count: "5"),
        ]
    }
}

extension PopularityLiveData {
    static func dummy() -> [PopularityLiveData] {
        return [
            PopularityLiveData(image: .drama1, count: "1", name: "환승연애3", episodes: "99화", rating: "27.2%"),
            PopularityLiveData(image: .drama2, count: "2", name: "별들에게 물어봐", episodes: "1화", rating: "4.2%"),
            PopularityLiveData(image: .drama3, count: "3", name: "선재 업고 튀어", episodes: "45화", rating: "0%"),
            PopularityLiveData(image: .drama4, count: "4", name: "지구오락실2", episodes: "12화", rating: "7.8%"),
            PopularityLiveData(image: .drama5, count: "5", name: "언젠가는 슬기로운 전공의생활", episodes: "98화", rating: "57.2%")
        ]
    }
}
extension PopularityMovieData {
    static func dummy() -> [PopularityMovieData] {
        return [
            PopularityMovieData(image: .movie8),
            PopularityMovieData(image: .movie7),
            PopularityMovieData(image: .movie6),
            PopularityMovieData(image: .movie5),
            PopularityMovieData(image: .movie4),
            PopularityMovieData(image: .movie3)
        ]
    }
}
extension BaseballData {
    static func dummy() -> [BaseballData] {
        return [
            BaseballData(image: .baseball1),
            BaseballData(image: .baseball2),
            BaseballData(image: .baseball3),
            BaseballData(image: .baseball4),
            BaseballData(image: .baseball5),
            BaseballData(image: .baseball6),
            BaseballData(image: .baseball7),
            BaseballData(image: .baseball8),
            BaseballData(image: .baseball9),
            BaseballData(image: .baseball10)
        ]
    }
}
extension TvData {
    static func dummy() -> [TvData] {
        return [
            TvData(image: .tv1),
            TvData(image: .tv2),
            TvData(image: .tv3),
            TvData(image: .tv4)
        ]
    }
}
extension Best5Data {
    static func dummy() -> [Best5Data] {
        return [
            Best5Data(image: .drama4),
            Best5Data(image: .drama2),
            Best5Data(image: .drama6),
            Best5Data(image: .drama1),
            Best5Data(image: .drama5)
        ]
    }
}

