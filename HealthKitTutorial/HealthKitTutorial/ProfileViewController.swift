//
//  ProfileViewController.swift
//  HealthKitTutorial
//
//  Created by 林东杰 on 11/18/15.
//  Copyright © 2015 Anta. All rights reserved.
//

import UIKit
import HealthKit


enum ProfileViewControllerTableViewIndex: Int {
    case Age = 0
    case Height
    case Weight
    case StepCount
}

enum ProfileKeys: String {
    case Age = "age"
    case Height = "height"
    case Weight = "weight"
    case StepCount = "stepCount"
}

enum HealthKitError : ErrorType {
    case NoPromission
    case Unknown
    case JoeyToDo
}

class ProfileViewController: UITableViewController {
    
    //MARK: - Variable
    private let kProfileUnit = 0
    private let kProfileDetail = 1
    
    var healthStore: HKHealthStore?
    
    private var userProfiles: [ProfileKeys: [String]]?
    

    
    //MARK: - Life Cycle
    
    override func viewDidAppear(animated: Bool) {
        /*
        设置一个HKHealthStore，向用户请求读写权限。
        这是第一个呈现在用户面前的页面，所以我们在这里请求用户许可。
        在其他APP上，你可以考虑在第一次用户要进入健康数据时请求用户许可。
        */
        // 判断健康数据在当前设备上是否可以用
        if !HKHealthStore.isHealthDataAvailable() {
            return
        }
        
        let writeDataTypes: Set<HKSampleType> = self.dataTypesToWrite()
        let readDataTypes: Set<HKObjectType> = self.dataTypesToRead()
        
        let completion: ((Bool, NSError?) -> Void)! = {
            (success,error) -> Void in
            
            if !success {
                print("You didn't allow HealthKit to access these read/write data types. In your app,try to handle this error gracefully when a user decides not to provide access. The error was:\(error). If ou're using a simulator, try it on a device.")
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                // Update the user interface based on the current user's health information.
                self.updateUsersAge()
                self.updateUsersHeight()
                self.updateUsersWeight()
                self.updateUsersStepCount()
            })
        }
        self.healthStore?.requestAuthorizationToShareTypes(writeDataTypes, readTypes: readDataTypes, completion: completion)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Your Profile"
        
        self.userProfiles = [ProfileKeys.Age: [NSLocalizedString("年龄 (年)", comment: ""),NSLocalizedString("未知", comment: "")],
                            ProfileKeys.Height: [NSLocalizedString("身高 (米)", comment: ""),NSLocalizedString("未知", comment: "")],
                            ProfileKeys.Weight: [NSLocalizedString("体重 (公斤)", comment: ""),NSLocalizedString("未知", comment: "")],
                            ProfileKeys.StepCount: [NSLocalizedString("步数 (步)", comment: ""),NSLocalizedString("未知", comment: "")]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Custom Delegate
    
    //MARK: - TableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO: sfsdf
    }
    
    //MARK: - TableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier: String = "CellIdentifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: CellIdentifier)
        }
        
        var profilekey: ProfileKeys?
        
        switch indexPath.row {
        case 0:
            profilekey = .Age
        case 1:
            profilekey = .Height
        case 2:
            profilekey = .Weight
        case 3:
            profilekey = .StepCount
        default:
            break
        }
        if let profiles = self.userProfiles {
            let profile: [String] = profiles[profilekey!] as [String]!
            
            cell!.textLabel!.text = profile.first as String!
            cell!.detailTextLabel!.text = profile.last as String!
        }
        return cell!
    }
    
    //MARK: - Event Response
    
    //MARK: - Private Methods
    
    /**
    向用户请求写入的健康数据集合
    - returns: 健康数据集合（HKSampleType）
    */
    private func dataTypesToWrite() -> Set<HKSampleType> {
        let dietaryCalorieEnergyType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let activeEnergyBurnType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
        let heightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
        let weightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!
        let stepCountType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!
        
        let writeDataTypes: Set<HKSampleType> = [dietaryCalorieEnergyType,activeEnergyBurnType,heightType,weightType,stepCountType]
        
        return writeDataTypes
        
    }
    
    /**
     向用户请求可以读取的健康数据集合
     - returns: 健康数据集合（HKObjectType）
     */
    private func dataTypesToRead() -> Set<HKObjectType> {
        let dietaryCalorieEnergyType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let activeEnergyBurnType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
        let heightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
        let weightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!
        let dayOfBirthType: HKCharacteristicType = HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!
        
        let stepCountType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!
        
        let readDataTypes: Set<HKObjectType> = [dietaryCalorieEnergyType,activeEnergyBurnType,heightType,weightType,stepCountType,dayOfBirthType]
        
        return readDataTypes
    }
    
    //MARK: - Reading HealthKit Data
    private func updateUsersAge() -> Void {
        
        let dateOfBirth: NSDate?
        do {
            dateOfBirth = try self.healthStore?.dateOfBirth()
        } catch _ as NSError {
            dateOfBirth = nil
        }
        if dateOfBirth == nil {
            print("获取个人年龄信息时发生异常，请检查是否在健康中开启")
            return
        }
        
        let now: NSDate = NSDate()
        let ageComponents: NSDateComponents = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: dateOfBirth!, toDate: now, options: NSCalendarOptions.WrapComponents)
        
        let userAge: Int = ageComponents.year
        let ageValue: String = NSNumberFormatter.localizedStringFromNumber(userAge, numberStyle: NSNumberFormatterStyle.NoStyle)
        
        if var userProfiles = self.userProfiles {
            var age:[String] = userProfiles[ProfileKeys.Age] as [String]!
            age[kProfileDetail] = ageValue
            userProfiles[ProfileKeys.Age] = age
            self.userProfiles = userProfiles
        }
        
        // 重新加载tableView
        let indexPath: NSIndexPath = NSIndexPath(forRow: ProfileViewControllerTableViewIndex.Age.rawValue, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    private func updateUsersHeight() -> Void {
        
    }
    
    private func updateUsersWeight() -> Void {
        
    }
    
    private func updateUsersStepCount() -> Void {
        
    }
    
    private func saveHeightIntoHealthStore(height: Double) -> Void {
    
    }
    
    private func saveWeightIntoHealthStore(height: Double) -> Void {
        
    }

    
    //MARK: - Getters/Setters
    
    

}










































