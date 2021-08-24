//
//  TempoTaskTests.swift
//  TempoTaskTests
//
//  Created by Zeinab Reda on 18/08/2021.
//

import XCTest
@testable import TempoTask

//class TempoTaskTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}

import Quick
import Nimble
import OHHTTPStubs
import RxSwift
import RxTest

class NewsListTests: QuickSpec {
    
    override func spec() {
        describe("News List") {
            let viewModel = NewsViewModel()
            beforeEach {
                OHHTTPStubs.setEnabled(true, for: URLSessionConfiguration.default)
                stub(condition: isAbsoluteURLString(K.ProductionServer.baseApiURL.rawValue + "viewed/7.json?api-key=\(K.ProductionServer.apiKey)")) { _ in
                    let stubPath = OHPathForFile("popular_articles.json", type(of: self))
                    if let stubPath = stubPath {
                        return fixture(filePath: stubPath, status: 200, headers: ["Content-Type": "application/json"])
                    } else {
                        return OHHTTPStubsResponse()
                    }
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
            
    
            
//            context("test news module") {
//                it("test fetch news") {
//                    viewModel.getSearchNewsResults(q: "a", pageSize: 10, page: 1)
//                    let news = try? viewModel.newsDriver.toBlocking().first()
//                    expect(news?.count).toEventually(equal(10))
//                }
//            }

            
       
//            context("test news module") {
//                it("test error value nil") {
//                    viewModel.getSearchNewsResults(q: "a", pageSize: 10, page: 1)
//                    let error = try? viewModel.errorDriver.toBlocking(timeout: 2).first()!
//                    expect(error).toEventually(beNil())
//                }
//            }
            
            
            
         

        }
    }
    
}
