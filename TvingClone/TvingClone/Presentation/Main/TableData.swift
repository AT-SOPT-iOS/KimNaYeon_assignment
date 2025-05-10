//
//  TableData.swift
//  TvingClone
//
//  Created by 김나연 on 5/10/25.
//

import Foundation

struct MovieData: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiCnt: String
    let audiAcc: String
}

extension MovieData {
    init(from daily: DailyBoxOffice) {
        self.rank = daily.rank
        self.movieNm = daily.movieNm
        self.openDt = daily.openDt
        self.audiCnt = daily.audiCnt
        self.audiAcc = daily.audiAcc
    }
}
