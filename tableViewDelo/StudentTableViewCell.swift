//
//  StudentTableViewCell.swift
//  tableViewDelo
//
//  Created by Tatiana Pasechnik on 6/04/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageViewShow: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
