//
//  ListViewController.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/8/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var notes:[Note]! = []
    var reversedNotes:[Note]! = []
    var sorted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view?.backgroundColor = .white
        setTitleLabelWithTitle(title: "随记")
        view.addSubview(tableView!)
        view.bringSubviewToFront(addButton)
        initNavigation()
        
        
        getAllNotes(completion: { (notes) in
            self.notes = notes
            self.tableView.reloadData()
        })
        
//        tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = RGBColor(r: 255, g: 234, b: 167, a: 0.5)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadNotes), name:NSNotification.Name.init("success"), object: nil)
       
    }
    
//    initNavigation
    func initNavigation() -> Void {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "up"), style: .plain, target: self, action: #selector(sort))

    }
    
//    MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes![indexPath.row]
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.setLabelViewContentWithNote(note: note)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        if editingStyle == .delete {
            tableView.beginUpdates()
//            删除数据，刷新notes数组
//            deleteNoteWithIndex(index: row)
//            sqlite的数据库的id是从1开始自增，为了方便删除不出错误，给note本身也设置了id这个属性和数据库的id对应，这样对应数据才能正确删除
            let note = notes[row]
            deleteNote(noteId: note.notesId)
//            为了保证数据同步，不能使用异步获取数据，否则会导致数据了UI的cell数目不匹配的问题
            notes = getAllNotes()
//            loadNotes()
//            删除对应行
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    

    @IBAction func popEditView(_ sender: Any) {
        let editVC = EditViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @objc func loadNotes() -> Void {
            getAllNotes(completion: { (notes) in
                   self.notes = notes
                self.tableView.reloadData()
               })
    }
    
    @objc func sort() -> Void {
        getAllNotes(completion: { (notes) in
            self.notes = notes
               })
        reversedNotes = self.notes
        if sorted {
            notes = reversedNotes
            navigationItem.rightBarButtonItem?.image = UIImage(named: "up")
        } else {
            notes = reversedNotes.reversed()
            navigationItem.rightBarButtonItem?.image = UIImage(named: "bottom")
        }
        sorted = !sorted
        tableView.reloadData()
    }
    
}

