//
//  DetailView.swift
//  Bookworm
//
//  Created by Alex Bardi on 7/27/22.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "UNK AUTHOR")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No words")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "UNK TITLE")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "The Things They Carried"
        book.author = "Tim O'Brien"
        book.genre = "Fantasy"
        book.rating = 5
        book.review = "My favorite!"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
