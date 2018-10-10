//
//  ViewController.swift
//  psamplee
//
//  Created by AFFIXUS IMAC1 on 8/17/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var beepView: UIView!
    @IBOutlet weak var beepTextField: UITextField!
    @IBOutlet weak var lbBeep: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let foods = ["Apples", "Bananas", "Corn", "Beans", "Tomatoes"]
    
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        beepView.isHidden = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.myviewTapped(_:))) // myVCName
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        beepTextField.addGestureRecognizer(tapGesture)
        beepTextField.isUserInteractionEnabled = true
    }

    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        beepView.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btDone(_ sender: UIButton) {
        beepView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return foods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return foods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        beepTextField.text = foods[row]
        lbBeep.text = foods[row]
        
    }
}

