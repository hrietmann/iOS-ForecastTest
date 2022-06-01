//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    
    let item: ForecastItem
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                Section {
                    Text("More content to come here")
                        .padding()
                        .frame(height: 200)
                } header: {
                    header
                }

            }
        }
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 16) {
                Image(item.type)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Day")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(item.day)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Description")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(item.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            Divider()
        }
        .background(.thickMaterial)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: .dummy)
    }
}
