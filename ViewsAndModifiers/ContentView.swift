//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Justin Hold on 2/22/23.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(.blue)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

extension View {
	func customButton() -> some View {
		modifier(CustomButtonModifier())
	}
}

struct Watermark: ViewModifier {
	var text: String
	
	func body(content: Content) -> some View {
		ZStack(alignment: .bottomTrailing) {
			content
			Text(text)
				.font(.caption)
				.foregroundColor(.white)
				.padding(5)
				.background(.black)
		}
	}
}

extension View {
	func watermarked(with text: String) -> some View {
		modifier(Watermark(text: text))
	}
}


struct ContentView: View {
    var body: some View {
        VStack {
			Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
			Spacer()
			Color.blue
				.frame(width: 300, height: 200)
				.watermarked(with: "@leftHandedApps")
				.padding()
			Spacer()
			Button("Continue", action: {})
				.customButton()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

