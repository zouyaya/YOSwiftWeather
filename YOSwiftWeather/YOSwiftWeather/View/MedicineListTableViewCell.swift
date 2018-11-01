//
//  MedicineListTableViewCell.swift
//  YOSwiftWeather
//
//  Created by yangou on 2018/10/31.
//  Copyright © 2018年 hello. All rights reserved.
//

import UIKit


class MedicineListTableViewCell: UITableViewCell {

    var bgView : UIView?
    var titleLabel : UILabel?
    var arrowView:UIImageView?
    var mapView:UIView?
    var iconView:UIImageView?
    var statusLabel:UILabel?
    var subTitle : UILabel?
    var maxTemp : UILabel?
    var minTemp : UILabel?
    
    
    func configureCell(forecast: Forecast) {
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.bgView = UIView(frame: CGRect(x: 10, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height - 5))
        self.backgroundColor = UIColor.black
        self.bgView?.layer.cornerRadius = 4;
        self.bgView?.clipsToBounds = true;
        self.contentView .addSubview(self.bgView!);
       
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 100, height: 30))
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.titleLabel?.text = "北京";
        self.bgView?.addSubview(self.titleLabel!)
        
        let arrowImage = UIImage.init(named: "Disclosure");
        self.arrowView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width - 30, y: 10, width: arrowImage!.size.width, height: arrowImage!.size.height))
        self.arrowView?.image = arrowImage;
        self.contentView.addSubview(self.arrowView!);
        
        self.mapView = UIView(frame: CGRect(x: 10, y: 40, width: UIScreen.main.bounds.size.width - 20, height: 135))
        self.mapView?.backgroundColor = UIColor.blue
        self.mapView?.layer.cornerRadius = 4;
        self.mapView?.clipsToBounds = true
        self.contentView .addSubview(self.mapView!)
        
        
        self.iconView = UIImageView(frame: CGRect(x: 15, y: 20, width: 80, height: 80))
        self.iconView?.backgroundColor = UIColor.red;
        self.iconView?.layer.cornerRadius = 4;
        self.iconView?.image = UIImage.init(named: "Mostly-sunny-day")
        self.iconView?.clipsToBounds = true;
        self.mapView?.addSubview(self.iconView!)
        
        self.statusLabel = UILabel(frame: CGRect(x: 105, y: 20, width: 100, height: 30))
        self.statusLabel?.textColor = UIColor.white
        self.statusLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.statusLabel?.text = "China"
        self.mapView?.addSubview(self.statusLabel!)
        
        self.subTitle = UILabel(frame: CGRect(x: 105, y: 70, width: 100, height: 30))
        self.subTitle?.textColor = UIColor.white
        self.subTitle?.font = UIFont.systemFont(ofSize: 20)
        self.subTitle?.text = "nihaoa"
        self.mapView?.addSubview(self.subTitle!)
        
        self.maxTemp = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 20, width: 80, height: 30))
        self.maxTemp?.textColor = UIColor.white
        self.maxTemp?.font = UIFont.boldSystemFont(ofSize: 20)
        self.maxTemp?.text = "℃"
        self.mapView?.addSubview(self.maxTemp!)
        
        self.minTemp = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 70, width: 80, height: 30))
        self.minTemp?.textColor = UIColor.white
        self.minTemp?.font = UIFont.systemFont(ofSize: 20)
        self.minTemp?.text = "℃"
        self.mapView?.addSubview(self.minTemp!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
