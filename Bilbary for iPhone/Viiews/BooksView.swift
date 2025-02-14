//
//  BooksView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 11/02/25.
//
import SwiftUI

struct BooksView: View {
    var toBooks = books

    var body: some View {
        VStack {
//            HStack {
//                Text("Books")
//                    .font(.title)
//                    .bold()
//                Spacer()
//            }
//            .padding()
            
            List {
                Section(header: Text("books" )) {
                    ForEach(toBooks, id: \.id) { book in
                        VStack(alignment: .leading) {
                            Text(book.name)
                                .font(.headline)
                            
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .listRowBackground(Color.black.opacity(0.2))
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}


struct BookIphone: Identifiable {
    let name: String
    let author: String
    var id: UUID = UUID()
}

let books: [BookIphone] = [
    BookIphone(name: "1984", author: "George Orwell"),
    BookIphone(name: "To Kill a Mockingbird", author: "Harper Lee"),
    BookIphone(name: "The Great Gatsby", author: "F. Scott Fitzgerald"),
    BookIphone(name: "Moby-Dick", author: "Herman Melville"),
    BookIphone(name: "Pride and Prejudice", author: "Jane Austen"),
    BookIphone(name: "The Catcher in the Rye", author: "J.D. Salinger"),
    BookIphone(name: "Brave New World", author: "Aldous Huxley"),
    BookIphone(name: "Crime and Punishment", author: "Fyodor Dostoevsky"),
    BookIphone(name: "War and Peace", author: "Leo Tolstoy"),
    BookIphone(name: "The Hobbit", author: "J.R.R. Tolkien"),
    BookIphone(name: "Fahrenheit 451", author: "Ray Bradbury"),
    BookIphone(name: "The Brothers Karamazov", author: "Fyodor Dostoevsky"),
    BookIphone(name: "The Lord of the Rings", author: "J.R.R. Tolkien"),
    BookIphone(name: "Jane Eyre", author: "Charlotte Brontë"),
    BookIphone(name: "Wuthering Heights", author: "Emily Brontë")
]
