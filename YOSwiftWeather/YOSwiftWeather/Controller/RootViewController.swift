//
//  RootViewController.swift
//  YOSwiftWeather
//
//  Created by yangou on 2018/10/31.
//  Copyright © 2018年 hello. All rights reserved.
//

import UIKit
import Alamofire


class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    var tableView : UITableView!
    var dataArray : NSMutableArray!
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "天气数据列表"

        dataArray = NSMutableArray();
      
        downloadForecastData {
            
           
        };
         self.initliazeView()
        
    }
    
    
    
    func initliazeView() {
        
        print(self.view.frame.size.width)
       tableView = UITableView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .grouped)
        tableView.delegate = self;
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.black
        tableView.tableFooterView = UIView()
        self.view .addSubview(tableView)
        
        
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.forecasts.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify = "medicineCell"
        var cell : MedicineListTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identify) as? MedicineListTableViewCell
        if cell == nil {
            cell = MedicineListTableViewCell(style: .default, reuseIdentifier: identify)
            cell.selectionStyle = .none;
            tableView.separatorStyle = .none;
        }
        
        let forecast = forecasts[indexPath.row]
        cell.minTemp?.text = "\(forecast.lowTemp)°C"
        cell.maxTemp?.text = "\(forecast.highTemp)°C"
        cell.statusLabel?.text = forecast.weatherDescription.capitalized
        cell.subTitle?.text = forecast.date.capitalized
        return cell;
    
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
