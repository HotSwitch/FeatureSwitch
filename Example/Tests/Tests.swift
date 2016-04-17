import UIKit
import XCTest
import FeatureSwitch

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnablingAndDisablingFeature() {
        // This is an example of a functional test case.
        let featureManager = FeatureManager()
        let featureName = "imageUpload"
        
        XCTAssert(!featureManager.isFeatureEnabled(featureName), "Pass")
        featureManager.enableFeature(featureName)
        XCTAssert(featureManager.isFeatureEnabled(featureName), "Pass")
        featureManager.disableFeature(featureName)
        XCTAssert(!featureManager.isFeatureEnabled(featureName), "Pass")
    }
    
    func testRunningFeatureWithCodeBlock() {
        // This is an example of a functional test case.
        let featureManager = FeatureManager()
        let featureName = "imageUpload"
        featureManager.enableFeature(featureName)
        
        var testFlag = false
        
        featureManager.ifFeatureEnabled(featureName) {
            testFlag = true
        }
        XCTAssert(testFlag, "Pass")
    }
    
    func testRunningBlockWhenEnabledLater() {
        // This is an example of a functional test case.
        let featureManager = FeatureManager()
        let featureName = "imageUpload"
        
        var testFlag = false        
        featureManager.whenEnabled(featureName) {
            testFlag = true
        }
        featureManager.enableFeature(featureName)
        XCTAssert(testFlag, "Pass")
    }
    
    func testRunningMultipleBlocksWhenEnabledLater() {
        // This is an example of a functional test case.
        let featureManager = FeatureManager()
        let featureName = "imageUpload"
        
        var testFlag = 0
        featureManager.whenEnabled(featureName) {
            testFlag += 10
        }
        featureManager.whenEnabled(featureName) {
            testFlag *= 10
        }
        featureManager.enableFeature(featureName)
        XCTAssert(testFlag == 100, "Expected 100, got \(testFlag)")
    }
    
    func testEnablingAndDisablingFeatureWithAnInitialSet() {
        var initialSet = Set<String>()
        let imageDownloadFeature = "imageDownload"
        initialSet.insert("imageDownload")
        
        let featureManager = FeatureManager(featureSet: initialSet)
        let imageUploadFeature = "imageUpload"
        
        XCTAssert(!featureManager.isFeatureEnabled(imageUploadFeature), "Pass")
        featureManager.enableFeature(imageUploadFeature)
        XCTAssert(featureManager.isFeatureEnabled(imageUploadFeature), "Pass")
        featureManager.disableFeature(imageUploadFeature)
        XCTAssert(!featureManager.isFeatureEnabled(imageUploadFeature), "Pass")
        
        XCTAssert(featureManager.isFeatureEnabled(imageDownloadFeature), "Pass")
        featureManager.enableFeature(imageDownloadFeature)
        XCTAssert(featureManager.isFeatureEnabled(imageDownloadFeature), "Pass")
        featureManager.disableFeature(imageDownloadFeature)
        XCTAssert(!featureManager.isFeatureEnabled(imageDownloadFeature), "Pass")
    }

    
}
