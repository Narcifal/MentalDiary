//
//  DatabaseService.swift
//  MentalDiary
//
//  Created by Danil Frolov on 05.12.2023.
//

import Foundation
import SwiftData

@MainActor
final class NotesDatabase {
    
    private var container: ModelContainer = {
        let schema = Schema([
            NoteModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    private var context: ModelContext
    
    init() {
        context = ModelContext(container)
    }
    
    func saveNote(note: NoteModel) {
        context.insert(note)
    }
    
    func fetchNotes(onCompletion: @escaping ([NoteModel]?, Error?) -> Void) {
        let descriptor = FetchDescriptor<NoteModel>(sortBy: [SortDescriptor<NoteModel>(\.date)])
        
        do {
            let data = try context.fetch(descriptor)
            onCompletion(data,nil)
        } catch {
            onCompletion(nil,error)
        }
    }
}
