//
//  NotificationView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack {
            Color.gray4
                .frame(height: 50)
                .cornerRadius(5)
            HStack {
                Text("공지")
                    .foregroundStyle(.gray2)
                    .font(.system(size: 11, weight: .medium))
                Text("티빙 계정 공유 정책 추가 안내")
                    .foregroundStyle(.gray1)
                    .font(.system(size: 11, weight: .medium))
                Spacer()
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.whiteT)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, 12)
        .padding(.top, 23)
    }
}

#Preview {
    NotificationView()
}
