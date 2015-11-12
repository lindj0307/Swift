//
//  HealthManager.swift
//  HealthKitTutorial
//
//  Created by 林东杰 on 11/12/15.
//  Copyright © 2015 Anta. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {
    
    //MARK: - Variable
    let healthKitStore:HKHealthStore = HKHealthStore()
    
    //MARK: - Life Cycle
    
    //MARK: - TableView Delegate
    
    //MARK: - Custom Delegate
    
    //MARK: - TableView Datasource
    
    //MARK: - Event Response
    
    //MARK: - Private Methods
    func authorizeHealthKit(completion: ((success:Bool, error: NSError!) -> Void)!) {
       
        if !HKHealthStore.isHealthDataAvailable() {
            return
        }
        
        let writeDataTypes: Set<HKSampleType> = self.dataTypesToWrite()
        let readDataTypes: Set<HKObjectType> = self.dataTypesToRead()
        
        let completion: ((Bool, NSError?) -> Void)! = {
            (success, error) -> Void in
            
            if !success {
                print("You didn't allow HealthKit to access these read/write data types. In your app, try to handle this error gracefully when a user decides not to provide access. The error was: \(error). If you're using a simulator, try it on a device.")
                
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                () -> Void in
                
                // Update the user interface based on the current user's health information.
//                self.updateUserAge()
                self.updateUsersHeight()
//                self.updateUsersWeight()
            })
        }
        
        healthKitStore.requestAuthorizationToShareTypes(writeDataTypes, readTypes: readDataTypes, completion: completion)
        
    }
    
    func authorizeHealthKit2(completion: ((success:Bool, error: NSError!) -> Void)!) {
        //1. Set the type you want to red from HK Store
        let helthKitTypesToRead = NSSet(arrayLiteral:[
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!,
            HKObjectType.workoutType()])
        
        // Set the types you want to write to HK Store
        let healthKitTypesToWrite = NSSet(arrayLiteral: [
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!,
            //HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,
            HKObjectType.workoutType()])
        
        //3. If the store is not available (for instance, iPad) returen an error and don't go on. 
        if !HKHealthStore.isHealthDataAvailable() {
            let error = NSError(domain: "Joey lin ", code: 2,
                userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if (completion != nil) {
                completion(success:false, error: error)
            }
            return;
        }
        
        //4. Request HealthKit authorization
        healthKitStore.requestAuthorizationToShareTypes((healthKitTypesToWrite as! Set<HKSampleType>), readTypes: (helthKitTypesToRead as! Set<HKObjectType>)) { (success, error) -> Void in
            if (completion != nil) {
                completion(success:success, error: error)
            }
        }
        
        
        
        
    }
    
    //MARK: HealthKit Permissions
    
    private func dataTypesToWrite() -> Set<HKSampleType>
    {
        let dietaryCalorieEnergyType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let activeEnergyBurnType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
        let heightType:  HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
        let weightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!
        
        let writeDataTypes: Set<HKSampleType> = [dietaryCalorieEnergyType, activeEnergyBurnType, heightType, weightType]
        
        return writeDataTypes
    }
    
    private func dataTypesToRead() -> Set<HKObjectType>
    {
        let dietaryCalorieEnergyType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let activeEnergyBurnType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
        let heightType:  HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
        let weightType: HKQuantityType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!
        let birthdayType: HKCharacteristicType = HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!
        let biologicalSexType: HKCharacteristicType = HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!
        
        let readDataTypes: Set<HKObjectType> = [dietaryCalorieEnergyType, activeEnergyBurnType, heightType, weightType, birthdayType, biologicalSexType]
        
        return readDataTypes
    }

    //MARK: - Reading HealthKit Data
//    func readProfile() -> (age: Int?, biologicalSex: HKBiologicalSexObject?, bloodType: HKBiologicalSexObject?)
//    {
//        var error: NSError?
//        var age: Int?
        
        // 1. Request Birthday and caculate age
//        let birthDay = healthKitStore.dateOfBirth()
//        if (birthDay = nil) {
//            let today = NSDate()
//            let calendar = NSCalendar.currentCalendar()
//            let diferenceComponents = NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate: birthDay, toDate: today, options: NSCalendarOptions(0))
//            age = diferenceComponents.year
//        }
//    }
    
    private func updateUsersHeight() -> Void
    {
        /*
        let setHeightInformationHandle: ((String) -> Void) = {
            (heightValue) -> Void in
            
            // Fetch user's default height unit in inches.
            let lengthFormatter: NSLengthFormatter = NSLengthFormatter()
            lengthFormatter.unitStyle = NSFormattingUnitStyle.Long
            
            let heightFormatterUnit: NSLengthFormatterUnit = .Inch
            let heightUniString: String = lengthFormatter.unitStringFromValue(10, unit: heightFormatterUnit)
            let localizedHeightUnitDescriptionFormat: String = NSLocalizedString("Height (%@)", comment: "");
            
            let heightUnitDescription: NSString = NSString(format: localizedHeightUnitDescriptionFormat, heightUniString);
            
            if var userProfiles = self.userProfiles {
                var height: [String] = userProfiles[ProfileKeys.Height] as [String]!
                height[self.kProfileUnit] = heightUnitDescription as String
                height[self.kProfileDetail] = heightValue as String
                
                userProfiles[ProfileKeys.Height] = height
                self.userProfiles = userProfiles
            }
            
            // Reload table view (only height row)
            let indexPath: NSIndexPath = NSIndexPath(forRow: ProfileViewControllerTableViewIndex.Height.rawValue, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        }
        
        let heightType: HKQuantityType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
        
        // Query to get the user's latest height, if it exists.
        let completion: HKCompletionHandle = {
            (mostRecentQuantity, error) -> Void in
            
            if mostRecentQuantity == nil {
                print("Either an error occured fetching the user's height information or none has been stored yet. In your app, try to handle this gracefully.")
                
                dispatch_async(dispatch_get_main_queue(), {
                    () -> Void in
                    let heightValue: String = NSLocalizedString("Not available", comment: "")
                    
                    setHeightInformationHandle(heightValue)
                })
                
                return
            }
            
            // Determine the height in the required unit.
            let heightUnit: HKUnit = HKUnit.inchUnit()
            let usersHeight: Double = mostRecentQuantity.doubleValueForUnit(heightUnit)
            
            // Update the user interface.
            dispatch_async(dispatch_get_main_queue(), {
                () -> Void in
                let heightValue: String = NSNumberFormatter.localizedStringFromNumber(NSNumber(double: usersHeight), numberStyle: NSNumberFormatterStyle.NoStyle)
                
                setHeightInformationHandle(heightValue)
            })
        }
        
        self.healthStore!.mostRecentQuantitySampleOfType(heightType, predicate: nil, completion: completion)
        */
    }
    
    //MARK: - Getters/Setters
    
    

}



























