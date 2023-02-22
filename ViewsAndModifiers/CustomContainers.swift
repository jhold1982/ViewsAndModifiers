//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Justin Hold on 2/22/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
	let rows: Int
	let columns: Int
	let content: (Int, Int) -> Content
	
	var body: some View {
		VStack {
			// having rows, id: \.self means rows COULD change
			// having ForEach(0..<rows) {} means rows WONT change
			ForEach(0..<rows, id: \.self) { row in
				HStack {
					ForEach(0..<columns, id: \.self) { column in
						content(row, column)
					}
				}
			}
		}
	}
}

struct CustomContainers: View {
    var body: some View {
		GridStack(rows: 4, columns: 4) { row, col in
			VStack {
				Image(systemName: "\(row * 4 + col).circle")
				Text("R\(row) C\(col)")
			}
		}
    }
}

struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
