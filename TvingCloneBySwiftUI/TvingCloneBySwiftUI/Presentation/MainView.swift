//
//  MainView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            HeaderView()
            NavigationBarView()
            ScrollView {
                Image(uiImage: .WYN)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                TodayTopTwentyGridView()
                RealTimePopularLIVEGridView()
                RealTimePopularMovieGridView()
                BaseBallGridView()
                TVGridView()
                MasterpieceOfKimghPDGridView()
                NotificationView()
                ServiceInformationView()
            }
        }.background(.blackT)
    }
}

#Preview {
    MainView()
}
