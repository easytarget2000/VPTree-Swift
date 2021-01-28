infix operator ~~

protocol Distance {
    static func ~~(lhs: Self, rhs: Self) -> Double
}

final class VPTree<T: Distance> {
    internal var firstNode: VPNode<T>
    
    init(elements: [T]) {
        firstNode = VPNode<T>(elements: elements)!;
    }
    
    private func _neighbors(point: T, limit: Int?, maxDistance: Double? = nil)
    -> [T] {
        var tau: Double = maxDistance ?? Double.infinity
        var nodesToTest: [VPNode<T>?] = [firstNode]
        
        var neighbors = PriorityQueue<T>(limit: limit)
        
        while(nodesToTest.count > 0) {
            if let node = nodesToTest.remove(at: 0) {
                let d = point ~~ node.vpPoint
                if d <= tau {
                    neighbors.push(weight: d, item: node.vpPoint)
                    if maxDistance == nil {
                        tau = neighbors.biggestWeigth
                    }
                }
                
                if node.isLeaf {
                    continue
                }
                
                if d < node.mu! {
                    if d < node.mu! + tau {
                        nodesToTest.append(node.leftChild)
                    }
                    if d >= node.mu! - tau {
                        nodesToTest.append(node.rightChild)
                    }
                } else {
                    if d >= node.mu! - tau  {
                        nodesToTest.append(node.rightChild)
                    }
                    if d < node.mu! + tau {
                        nodesToTest.append(node.leftChild)
                    }
                }
            }
        }
        
        return neighbors.items
    }
    
    func findNeighbors(point: T, limit: Int) -> [T] {
        return _neighbors(point: point, limit: limit, maxDistance: nil)
    }
    
    func findClosest(point: T, maxDistance: Double) -> [T] {
        return _neighbors(point: point, limit: nil, maxDistance: maxDistance)
    }
    
}
