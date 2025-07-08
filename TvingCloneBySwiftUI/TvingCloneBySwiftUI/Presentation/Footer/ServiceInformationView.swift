//
//  ServiceInformationView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct ServiceInformationView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack {
                    Text("고객문의 · 이용약관 ·")
                        .foregroundStyle(.gray2)
                        .font(.system(size: 11, weight: .medium))
                    Text("개인정보처리방침")
                        .foregroundStyle(.whiteT)
                        .font(.system(size: 11, weight: .medium))
                }
                Text("사업자정보 · 인재채용")
                    .foregroundStyle(.gray2)
                    .font(.system(size: 11, weight: .medium))
            }
            .padding(.leading, 16)
            .padding(.top, 13)
            Spacer()
        }
    }
}

#Preview {
    ServiceInformationView()
}
