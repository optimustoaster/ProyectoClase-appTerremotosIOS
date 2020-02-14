//
//  TableViewCell.swift
//  AppTerremotos
//
//  Created by  on 31/01/2020.
//  Copyright © 2020 none.none. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelNombreSitio: UILabel!
    @IBOutlet weak var labelValorMagnitud: UILabel!
    @IBOutlet weak var labelValorHora: UILabel!
    @IBOutlet weak var labelValorPosibleTsunami: UILabel!
    @IBOutlet weak var buttonMaps: UIButton!
    @IBOutlet weak var buttonUsgs: UIButton!
    @IBOutlet weak var buttonInAppMap: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
