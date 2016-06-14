//
//  FeatureManager.swift
//  Pods
//
//  Created by Ravel Antunes on 4/12/16.
//
//

import UIKit

public class FeatureManager: NSObject {
    
    public static let sharedInstance: FeatureManager = {
        return FeatureManager()
    }()

    
    private var featureSet: Set<String>
    private var featureExecutionMap: [String: [(()->())]] = [:]
    
    public override init() {
        featureSet = Set<String>()
        super.init()
    }
    
    public init(featureSet: Set<String>) {
        self.featureSet = featureSet
        super.init()
    }
    
    public func whenEnabled(featureName: String, run: () -> Void) {
        if isFeatureEnabled(featureName: featureName) {
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
    
    public func ifFeatureEnabled(featureName: String, run: () -> Void) {
        guard isFeatureEnabled(featureName: featureName) else {
            return
        }
        run()
    }
    
    //MARK: - TOGGLING AND VERIFICATION
    
    public func enableFeature(featureName: String) {
        featureSet.insert(featureName)
        
        guard let executions = featureExecutionMap[featureName] else {
            return
        }
        
        executions.forEach({ (block: (() -> ())) -> () in
            print("executing for \(featureName)")
            block()
        })

    }
    
    public func disableFeature(featureName: String) {
        featureSet.remove(featureName)
    }

    public func isFeatureEnabled(featureName: String) -> Bool {
        return featureSet.contains(featureName)    
    }
}
