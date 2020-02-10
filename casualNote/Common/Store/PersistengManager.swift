//
//  NoteDAO.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/9/20.
//  Copyright © 2020 CasualNotes. All rights reserved.


/*
 使用SQLite代替UserDefault来存储
 增删改查
 */

import Foundation
import SQLite

func insertNote(note: Note) {
    let insertSQL = notesTable.insert(content <- note.content, timestamp <- note.timestamp, image <- note.image)
    do {
        try sqliteDatabase.run(insertSQL)
        
    } catch {
        print(error)
    }
}


func deleteNote(noteId: Int) {
    let content = notesTable.filter(id == noteId)
    let deleteSQL = content.delete()
    do {
        try sqliteDatabase.run(deleteSQL)
    } catch {
        print(error)
    }
}


func getAllNotes(completion: @escaping (_: [Note])->())->[Note] {
    var notes: [Note] = []
    
    DispatchQueue.global().async {
        do {
            //        获取数据库（connected to database）
            let database = try Connection(DBPath())
            sqliteDatabase = database
            
            let allNotes = try sqliteDatabase.prepare(notesTable)
            
            //         这里就是 数据转模型，把数据库里的数据存到模型的属性里
            for note in allNotes {
                //            注意这里的singleNote一定要初始化
                var singleNote = Note(content: "", timestamp: 0, id: 0, image: Data())
                singleNote.content = note[content]
                singleNote.timestamp = note[timestamp]
                //            数据库的自增id可用于删除数据时使用
                singleNote.notesId = note[id]
                singleNote.image = note[image]
                notes.append(singleNote)
                
            }
            DispatchQueue.main.async {
                completion(notes)
            }
        } catch {
            print(error)
        }
    }
    
    
    return notes
}
 
