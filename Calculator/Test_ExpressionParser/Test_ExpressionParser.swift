//
//  Test_ExpressionParser.swift
//  Test_ExpressionParser
//
//  Created by 허건 on 2022/05/22.
//

import XCTest
@testable import Calculator

class Test_ExpressionParser: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_componentsByOperators_실행했을때_₩Split이되는지() {
        // ginven
        let input: String = "1123 + 2 - 3 * 4 / 5"
        let output: [String] = ["1123", "+", "2", "-", "3", "*", "4", "/", "5"]
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, output)
    }

    func test_parse_result_실행했을때_result_반환되는지() {
        // ginven
        let input: String = "211 - 1 + 1"
        let output = 211.0
        
        // when
        var result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(try result.result(), output)
    }

}
