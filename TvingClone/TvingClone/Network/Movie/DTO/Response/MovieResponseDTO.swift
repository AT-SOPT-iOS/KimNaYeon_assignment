//
//  MovieResponseDTO.swift
//  TvingClone
//
//  Created by 김나연 on 5/11/25.
//

struct MovieResponseDTO: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiCnt: String
    let audiAcc: String
}
