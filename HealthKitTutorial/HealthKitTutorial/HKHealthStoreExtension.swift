//
//  HKHealthStoreExtension.swift
//  HealthKitTutorial
//
//  Created by 林东杰 on 11/26/15.
//  Copyright © 2015 Anta. All rights reserved.
//

import Foundation
import HealthKit

typealias HKCompletionHandle = ((HKQuantity!, NSError) -> Void)

extension HKHealthStore {
    func getClassName(obj: AnyObject) -> String {
        let objectClass: AnyClass! = object_getClass(obj)
        let className = objectClass.description()
        
        return className
    }
    
    func mostRecentQuantitySampleOfType(quantityType: HKQuantityType, predicate: NSPredicate!, completion: HKCompletionHandle!) -> Void {
        let timeSortDescript: NSSortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query: HKSampleQuery = HKSampleQuery(sampleType: quantityType, predicate: nil, limit: 1, sortDescriptors: [timeSortDescript]) {
            (query, results, error) -> Void in
            if results == nil {
                if completion != nil {
                    completion(nil, (error)!)
                }
                return
            }
            
            if completion != nil {
                let quantitySample: HKQuantitySample? = results!.last as? HKQuantitySample
                let quantity: HKQuantity? = quantitySample?.quantity
                
                completion(quantity,(error)!)
            }
        }
        self.executeQuery(query)
    }
    
}
