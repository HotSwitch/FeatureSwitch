//
//  FeatureManager.swift
//  Pods
//
//  Created by Ravel Antunes on 4/12/16.
//
//

import UIKit

@objc open class FeatureManager: NSObject {
    
    @objc open static let sharedInstance: FeatureManager = {
        return FeatureManager()
    }()

    
    fileprivate var featureSet: Set<String>
    fileprivate var featureExecutionMap: [String: [(()->())]] = [:]
    
    @objc public override init() {
        featureSet = Set<String>()
        super.init()
    }
    
    @objc public init(featureSet: Set<String>) {
        self.featureSet = featureSet
        super.init()
    }
    
    @objc open func whenEnabled(_ featureName: String, run: @escaping () -> Void) {
        if isFeatureEnabled(featureName) {
            //Run right away if feature is enabled
            run()
        } else {
            //If not enabled, either add to existing array of functions, or create a new array
            if var featureExecutions = featureExecutionMap[featureName] {
                featureExecutions.append(run)
                featureExecutionMap[featureName] = featureExecutions
            } else {
                featureExecutionMap[featureName] = [run]
            }
        }
    }
    
    @objc open func ifFeatureEnabled(_ featureName: String, run: () -> Void) {
        guard isFeatureEnabled(featureName) else {
            return
        }
        run()
    }
    
    //MARK: - TOGGLING AND VERIFICATION
    
    @objc open func enableFeature(_ featureName: String) {
        featureSet.insert(featureName)
        
        guard let executions = featureExecutionMap[featureName] else {
            return
        }
        
        executions.forEach({ (block: (() -> ())) -> () in
            print("executing for \(featureName)")
            block()
        })

    }
    
    @objc open func disableFeature(_ featureName: String) {
        featureSet.remove(featureName)
    }

    @objc open func isFeatureEnabled(_ featureName: String) -> Bool {
        return featureSet.contains(featureName)    
    }
}
