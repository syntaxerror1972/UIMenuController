//
//  ViewController.swift
//  UIMenuController
//
//  Created by Shrawan Shinde on 23/01/17.
//  Copyright © 2017 Shrawan Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        // make TextField
        let textFieldView: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textFieldView.text = "Click here to display Menues!"
        textFieldView.delegate = self
        textFieldView.borderStyle = UITextBorderStyle.roundedRect
        textFieldView.layer.position = CGPoint(x: self.view.frame.width/2, y: 100)
        
        // add TextFieldView
        self.view.addSubview(textFieldView)
        
        // make MenuController
        let menuController: UIMenuController = UIMenuController.shared
        
        // make menu visible on MenuController
        menuController.isMenuVisible = true
        
        // set the arrow down.
        menuController.arrowDirection = UIMenuControllerArrowDirection.down
        
        // set rect、view
        menuController.setTargetRect(CGRect.zero, in: self.view)
        
        // make MenuItems
        let menuItem1: UIMenuItem = UIMenuItem(title: "Menu 1", action: #selector(onMenuClicked1))
        let menuItem2: UIMenuItem = UIMenuItem(title: "Menu 2", action: #selector(onMenuClicked2))
        let menuItem3: UIMenuItem = UIMenuItem(title: "Menu 3", action: #selector(onMenuClicked3))
        
        // make an array to store MenuItems
        let menuItems: NSArray = [menuItem1, menuItem2, menuItem3]
        
        // add MenuItems to MenuController
        menuController.menuItems = menuItems as? [UIMenuItem]
    }
    
    // called when textField begin editing.
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    // called when textField end editing.
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    
    // make the action on Menu active.
     func canPerformAction(action: Selector, withSender sender: AnyObject!) -> Bool {
        if action == #selector(onMenuClicked2) || action == #selector(onMenuClicked2) || action == #selector(onMenuClicked3) {
            return true
        }
        return false
    }
    
    // called when the menus are clicked.
    internal func onMenuClicked1(sender: UIMenuItem) {
        print("onMenuClicked1")
    }
    internal func onMenuClicked2(sender: UIMenuItem) {
        print("onMenuClicked2")
    }
    internal func onMenuClicked3(sender: UIMenuItem) {
        print("onMenuClicked3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

