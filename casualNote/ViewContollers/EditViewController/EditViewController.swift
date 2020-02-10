//
//  EditViewController.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/8/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit

class EditViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var imagePickerController: UIImagePickerController! = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTextView()
        initNaviation()
        initViews()
        
    }
    
//    MARK: Init
    func initTextView() -> Void {
        textView.font = .systemFont(ofSize: 25)
//        解决TextView文字不在最开始的地方
        self.automaticallyAdjustsScrollViewInsets = false
//        待会根据是编辑状态还是新建状态
        textView.becomeFirstResponder()
    }
    
    func initNaviation() -> Void {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(saveNote))
                
//        navigationItem.leftBarButtonItem?.title = "返回"， 这样修改没用
        let backButton = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(popView))
        navigationItem.leftBarButtonItem = backButton
        
        setTitleLabelWithTitle(title: "写笔记")
    }
    
    func initViews() -> Void {
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
    }

// MARK: Actions
    @objc func saveNote() {
//        saveNotesWithSingleNote(note: Note(content: textView.text, timestamp: getTimestamp()))
        let savedImage = pictureView.image
        if savedImage != nil {
            let note = Note(content: textView.text, timestamp: getTimestamp(), id: 0, image: pictureView.image!.pngData()!)
            insertNote(note: note)
            NotificationCenter.default.post(name:NSNotification.Name.init("success"), object:nil)
            
            navigationController?.popViewController(animated: true )
        } else {
            let alertController = UIAlertController(title: "可爱你插入一张图片呗💖", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            navigationController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func jumpToPhotoLibray(_ sender: Any) {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
//    MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage]
        pictureView.image = selectedImage as? UIImage
        pictureView.contentMode = .scaleAspectFill
//        暂时先把选择图片后button设置不见的方法
        button.isEnabled = false
        button .setImage(UIImage(), for: .disabled)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
}
