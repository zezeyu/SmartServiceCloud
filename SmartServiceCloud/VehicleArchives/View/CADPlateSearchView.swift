//
//  CADPlateSearchView.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/20.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
import HZSwiftLib
import RxSwift
let disposeBag = DisposeBag()
class CADPlateSearchView: UIView, NibLoadable {

    /**
     *搜索框
     */
    @IBOutlet weak var searchTextField: QMUITextField!
    
    @IBOutlet weak var searchImageView: UIImageView!
    
    typealias blockStr = (_ text:String) -> Void
    
    var blockSerachText: blockStr?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 17.5.hr
        self.layer.masksToBounds = true
        ClickSearch()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 17.5.hr
        self.layer.masksToBounds = true
        ClickSearch()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ClickSearch()
    }
    
    func ClickSearch() {
        if searchImageView != nil{
            searchImageView.addTapGesture(target: self, selector: #selector(search_content))
        }
        if searchTextField != nil{
            searchTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { (_) in
                self.search_content()
            }).disposed(by: disposeBag)
            searchTextField.rx.controlEvent(.editingDidBegin).subscribe(onNext: { (_) in
//                self.searchTextField
            }).disposed(by: disposeBag)
        }
    }

    @objc func search_content() {
        if self.blockSerachText != nil{
            self.blockSerachText!(self.searchTextField.text!)
        }
    }
    
}
