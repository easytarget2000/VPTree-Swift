import XCTest

class ArrayTests: XCTestCase {
    
    func testSplitByMedian_GivenValidValues_ReturnsExpectedLeftAndRight () {
        let lut: Array<Int> = [2, 1, 3, 5, 4, 6, 7]
        let result: (left: [Int], right: [Int]) = lut.splitByMedian()
        
        XCTAssertTrue(result.left.contains(1))
        XCTAssertTrue(result.left.contains(2))
        XCTAssertTrue(result.left.contains(3))
        XCTAssertTrue(result.left.contains(4))
        
        XCTAssertEqual(result.left.count, 4)
        
        XCTAssertTrue(result.right.contains(5))
        XCTAssertTrue(result.right.contains(6))
        XCTAssertTrue(result.right.contains(7))
        
        XCTAssertEqual(result.right.count, 3)
    }
    
}
