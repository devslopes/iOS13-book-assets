//
//  PurchaseCell.swift
//  InAppPurchases

import UIKit

class PurchaseCell: UICollectionViewCell {
    
    @IBOutlet weak var purchaseImage: UIImageView!
    @IBOutlet weak var purchaseLbl: UILabel!
    
    func configureCell(imageName: String, price: String) {
        switch imageName {
        case "com.devslopes.InAppPurchases.tier1":
            purchaseImage.image = UIImage(named: "Arcade-1")
            purchaseLbl.text = price
        case "com.devslopes.InAppPurchases.tier2":
            purchaseImage.image = UIImage(named: "Arcade-2")
            purchaseLbl.text = price
        case "com.devslopes.InAppPurchases.tier3":
            purchaseImage.image = UIImage(named: "Arcade-3")
            purchaseLbl.text = price
        case "com.devslopes.InAppPurchases.tier4":
            purchaseImage.image = UIImage(named: "Arcade-4")
            purchaseLbl.text = price
        case "com.devslopes.InAppPurchases.tier5":
            purchaseImage.image = UIImage(named: "Bear-1")
            purchaseLbl.text = price
        default:
            break
        }
    }
}
