//
//  AvatarVC.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController{
    
    var network: NetworkCall?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network?.getData(id: "287", completion: { [weak self] (data: String) in
             print("step2")
            self?.useData(data:data)
        })
                
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popVC(sender:)))
        
        self.navigationItem.leftBarButtonItem?.tintColor = .black
                
        view.backgroundColor = UIColor(red: 104/255.0, green: 155/255.0, blue: 208/255.0, alpha: 1.0)
        
        view.addSubview(imageView)
        imageConstraints()
        
        view.addSubview(label)
        labelConstraints()

    }
    
    func useData(data: String){
        print("hello world")
        print(data)
    }
    
    @objc func popVC(sender: UIBarButtonItem){
        
        navigationController?.popViewController(animated: true)
    }
    
    let imageView: UIImageView = {
        
        let image = UIImageView()
        return image
        
    }() // the result of closure goes into the imageView
    
    let label : UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0 // word-wrap
        label.backgroundColor = .cyan
        return label
        
    }()
    
    func labelConstraints(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.topAnchor.constraint(equalTo: label.topAnchor, constant: 190).isActive = true
        //label.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 12).isActive = true
        //label.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 12).isActive = true
                
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func imageConstraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        
        imageView.layer.masksToBounds = true // sublayer clipped to layer's bounds
        imageView.layer.cornerRadius = 15
        
    }
    
}
