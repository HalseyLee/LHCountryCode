//
//  LHCountryCodeController.swift
//  LHCountryCode
//
//  Created by hope on 2017/12/18.
//  Copyright © 2017年 Halsey. All rights reserved.
//

import UIKit

class LHCountryCodeController: UIViewController {
    
    var countryCodeTableView: UITableView!
    //var searchBar: UISearchBar!
    var searchController: UISearchController!
    
    var searchResultValuesArray: NSMutableArray?
    var indexArray: NSArray?
    var sortNameDict = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "国家代码"
        self.view.backgroundColor = UIColor.white
        
        creatSubViews()
    }
    
    func creatSubViews(){
        searchResultValuesArray = NSMutableArray(capacity: 0)
        countryCodeTableView = UITableView(frame:  CGRect(x: 0, y: 20, width: self.view.bounds.width, height: self.view.bounds.height), style: .plain)
        self.view.addSubview(countryCodeTableView)
        countryCodeTableView.autoresizingMask = .flexibleWidth
        countryCodeTableView.dataSource = self
        countryCodeTableView.delegate = self
        countryCodeTableView.backgroundColor = UIColor.white
        countryCodeTableView.sectionIndexBackgroundColor = UIColor.clear
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        countryCodeTableView.tableHeaderView = searchController.searchBar
        
        let path = Bundle.main.path(forResource: "sortedChnames", ofType: "plist")
        sortNameDict = NSDictionary(contentsOfFile: path!)!
        
        indexArray = NSArray(array: sortNameDict.allKeys).sorted(by: { (obj1, obj2) -> Bool in
            return (obj1 as! String) < (obj2 as! String)
        }) as NSArray
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LHCountryCodeController: UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating{
   
    
    func updateSearchResults(for searchController: UISearchController) {
      
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
           return 1
        }else{
            return sortNameDict.allKeys.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return (searchResultValuesArray?.count)!
        }else{
            let array = sortNameDict.object(forKey: indexArray![section]) as! NSArray
            return array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searchController.isActive {
            let id2 = "cellIdentifier2"
            var cell = tableView.dequeueReusableCell(withIdentifier: id2)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: id2)
            }
            if (searchResultValuesArray?.count)! > 0{
                cell?.textLabel?.text = searchResultValuesArray?.object(at: indexPath.row) as? String
            }
            return cell!
        }else{

            let id1 = "cellIdentifier1"
            var cell = tableView.dequeueReusableCell(withIdentifier: id1)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: id1)
            }
            let section = indexPath.section
            let row = indexPath.row
            let tempstr = (sortNameDict.object(forKey: indexArray?[section]) as! NSArray)[row]
            cell?.textLabel?.text = tempstr as? String
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchController.isActive {
            return nil
        }else{
            return indexArray as? [String]
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if !searchController.isActive {
            return 30
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArray?.object(at: section) as? String
    }
 
}

