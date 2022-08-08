//
//  CADVehicleDetailsHeadView.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/26.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit

class CADVehicleDetailsHeadView: UIView,NibLoadable {

    typealias blockInt = (_ tag:Int) -> Void
    var blockButtonAction: blockInt?
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var model: CADVehicleDetailsModel? { didSet {
        if self.tag == 88{
            let button:UIButton = self.viewWithTag((model?.section2ButtonIndex)!) as! UIButton
            isSelectedAction(sender: button)
        }else{
            let button:UIButton = self.viewWithTag((model?.section3ButtonIndex)!) as! UIButton
            isSelectedAction(sender: button)
        }
      }
    }
    
    @IBAction func button1Action(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isSelectedAction(sender: sender)
        if blockButtonAction != nil {
            blockButtonAction!(sender.tag)
        }
        
    }
    
    @IBAction func button2Action(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isSelectedAction(sender: sender)
        if blockButtonAction != nil {
            blockButtonAction!(sender.tag)
        }
    }
    @IBAction func button3Action(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isSelectedAction(sender: sender)
        if blockButtonAction != nil {
            blockButtonAction!(sender.tag)
        }
    }
    
    func isSelectedAction(sender:UIButton){
        button1.isSelected = false
        button2.isSelected = false
        button3.isSelected = false
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        sender.isSelected = true
        if button1.isSelected { view1.isHidden = false }
        if button2.isSelected { view2.isHidden = false }
        if button3.isSelected { view3.isHidden = false }
    }
}
