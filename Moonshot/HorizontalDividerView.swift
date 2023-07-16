//
//  HorizontalDivider.swift
//  Moonshot
//
//  Created by David Ash on 16/07/2023.
//

import SwiftUI

struct HorizontalDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDividerView()
            .preferredColorScheme(.dark)
    }
}
