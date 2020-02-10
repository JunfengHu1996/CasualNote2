//
//  DBHelper.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/9/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import Foundation
import SQLite

var sqliteDatabase: Connection!

// 表
let notesTable = Table("notes")
// 关键字
let id = Expression<Int>("id")
let content = Expression<String>("content")
let timestamp = Expression<Int>("timestamp")
let image = Expression<Data>("image")


// 获取数据库相关路径
func DBFolder() -> String {
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    let folderPath = docDir?.appendingPathComponent("folder").path
    print(folderPath!)
    
    return folderPath!
}

func DBPath() -> String {
    let folderPath = DBFolder()
    let filePath: String = folderPath + "/db.sqlite"
    
    return filePath
}


// 创建数据库操作
func buildDataBase() -> Void {
//    如何folder文件夹没创建的话，先创建folder
    if !FileManager.default.fileExists(atPath: DBFolder()) {
        do {
            try FileManager.default.createDirectory(atPath: DBFolder(), withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error)
            
        }
        
    }
    do {
//            创建数据库
            let database = try Connection(DBPath())
            sqliteDatabase = database
            print("创建数据库成功")
//            建表
            createTable()
        } catch  {
            print(error)
        }
    
}

func createTable() -> Void {
    print("创建表")
    
    let createTableSQL = notesTable.create { (table) in
        table.column(id, primaryKey: true)
        table.column(content)
        table.column(timestamp, unique: true)
        table.column(image)
    }
    
    do {
        try sqliteDatabase.run(createTableSQL)
        print("建表成功")
    } catch {
        print(error)
    }
    
}
