//
//  FlagDetailViewController.swift
//  project3review
//
//  Created by Ana Caroline de Souza on 19/12/19.
//  Copyright © 2019 Ana e Leo Corp. All rights reserved.
//

import UIKit

class FlagDetailViewController: UIViewController {
   
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped(){
        
        guard let realImage = imageView.image else {return}
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 500 , height: 500))
        
        let imageToShare = renderer.image { ctx in
            
            realImage.draw(at: CGPoint(x: 100, y: 100))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 32),
                .paragraphStyle: paragraphStyle
            ]

            let string = "The meme generator is real"

            let attributedString = NSAttributedString(string: string, attributes: attrs)

            attributedString.draw(with: CGRect(x: 100, y: 100, width: imageView.frame.width/2, height: imageView.frame.height/2), options: .usesLineFragmentOrigin, context: nil)
        }
        
        guard let image = imageToShare.jpegData(compressionQuality: 0.8) else
        {
            print("no image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem =
            navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
