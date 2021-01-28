private func <<T>(left: VPoint<T>, right: VPoint<T>) -> Bool {
    return left.d < right.d
}

private func ==<T>(left: VPoint<T>, right: VPoint<T>) -> Bool {
    return left.d == right.d
}

private final class VPoint<T>: Comparable {
    var d: Double
    let point: T
    
    init(d: Double, point: T) {
        self.d = d
        self.point = point
    }
}

internal final class VPNode<T: Distance> {
    var vpPoint: T!
    var points: [T] = []
    var mu: Double?
    var leftChild: VPNode<T>?
    var rightChild: VPNode<T>?
    
    convenience init?(elements: ArraySlice<T>) {
        self.init(elements: [T](elements))
    }
    
    private func convertion (item: VPoint<T>) -> T {
        return item.point
    }
    
    convenience init?(elements: [T]) {
        let array: [VPoint<T>] = elements.map {
            (item: T) -> VPoint<T> in
            return VPoint<T>(d: 0, point: item)
        }
        
        self.init(elements: array)
    }
    
    private init?(elements: [VPoint<T>]) {
        if elements.count == 0 {
            return nil
        }
        var elements = elements
        //Random get of the VP points
        self.vpPoint = elements.remove(at: 0).point
        
        if elements.count == 0 {
            return
        }
        
        for item in elements {
            item.d = item.point ~~ self.vpPoint
        }
        
        let splitElements: (left: [VPoint<T>], right: [VPoint<T>])
            = elements.splitByMedian()
        
        mu = splitElements.left.last!.d
        leftChild = VPNode(elements: splitElements.left)
        rightChild = VPNode(elements: splitElements.right)
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
}
