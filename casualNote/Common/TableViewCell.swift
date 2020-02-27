//
//  TableViewCell.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/9/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var containerView = UIView()
    var cardImageView = UIImageView()
    var lableView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
        addViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelViewContentWithNote(note:Note) -> Void {
        self.cardImageView.perform(#selector(setter: UIImageView.image), with:  UIImage(data: note.image), afterDelay: 0, inModes: [.default])
        self.lableView.perform(#selector(setter: UILabel.text), with: note.content, afterDelay: 0, inModes: [.default])
        
    }
    
    func initSubviews() -> Void {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        lableView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .white
        contentView.backgroundColor = RGBColor(r: 255, g: 234, b: 167, a: 0.5)
        
        lableView.backgroundColor = RGBColorBase()
        
        lableView.textColor = .black
        lableView.textAlignment = .center
        lableView.font = .systemFont(ofSize: 20)
        
        containerView.layer.cornerRadius = 50
        containerView.layer.masksToBounds = true
        
        cardImageView.contentMode = .scaleAspectFill
    }
    
    func addViews() -> Void {
        containerView.addSubview(cardImageView)
        containerView.addSubview(lableView)
        contentView.addSubview(containerView)
    }
    
    func layoutViews() -> Void {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        cardImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        cardImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        cardImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        cardImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.75).isActive = true
        
        lableView.topAnchor.constraint(equalTo: cardImageView.bottomAnchor).isActive = true
        lableView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        lableView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        lableView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.25).isActive = true
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

