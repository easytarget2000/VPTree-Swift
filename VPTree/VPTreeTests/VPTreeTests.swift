import XCTest

class VPTreeTests: XCTestCase {
    
    func testFindNeighbors() {
        let p1 = VPTreePoint(x: 0, y: 0)
        let p2 = VPTreePoint(x: 1, y: 1)
        let p3 = VPTreePoint(x: 1, y: 0)
        let p4 = VPTreePoint(x: 0, y: 1)
        
        let tree = VPTree(elements: [p1, p2, p3])
        
        let founds = tree.findNeighbors(point: p4, limit: 3)
        
        XCTAssertEqual(founds.count, 3)
    }
    
    func testFindClosest() {
        let p1 = VPTreePoint(x: 0, y: 0)
        let p2 = VPTreePoint(x: 1, y: 1)
        let p3 = VPTreePoint(x: 1, y: 0)
        let p4 = VPTreePoint(x: 0, y: 1)
        
        let tree = VPTree(elements: [p1, p2, p3])
        
        let founds = tree.findClosest(point: p4, maxDistance: 1.0)
        
        XCTAssertEqual(founds.count, 2)
    }
    
    #warning("TODO: Restore measurement test.")
    
    // MARK: - Internals
    
    private struct VPTreePoint: Distance {
        let x: Double
        let y: Double
        
        static func ~~ (lhs: VPTreePoint, rhs: VPTreePoint) -> Double {
            return Double(
                pow(pow(lhs.x - rhs.x, 2) + pow(lhs.y - rhs.y, 2), 0.5)
            )
        }
    }
    
    private struct Photo: Distance {
        let id: Int
        let pHash: UInt64
        
        static func ~~ (lhs: Photo, rhs: Photo)
        -> Double {
            return Double(Photo.hammingWeight(x: (lhs.pHash^rhs.pHash)))
        }
        
        private static func hammingWeight(x: UInt64) -> Int {
            var i = x
            i = i - ((i >> 1) & 0x55555555);
            i = (i & 0x33333333) + ((i >> 2) & 0x33333333);
            return Int((((i + (i >> 4)) & 0x0F0F0F0F) * 0x01010101) >> 24)
        }
    }
}
