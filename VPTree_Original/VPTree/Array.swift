private func split<T: Comparable>(
    _ array: inout [T],
    _ nbItemLeft: Int,
    _ nbItemRight: Int
) -> (Array<T>, Array<T>) {
    var left: Array<T> = []
    var right: Array<T> = []
    var middle: Array<T> = []
    
    left.reserveCapacity(nbItemLeft)
    right.reserveCapacity(nbItemRight)
    
    if (nbItemLeft == 0) {
        return (left, array)
    }
    
    if (nbItemRight == 0) {
        return (array, right)
    }
    
    if (nbItemLeft == 1 && nbItemRight == 1) {
        if array[0] < array[1] {
            return ([array[0]], [array[1]])
        } else {
            return ([array[1]], [array[0]])
        }
    }
    
    let pivot: T = array[nbItemLeft]
    for element in array {
        if element < pivot {
            left.append(element)
        } else if element > pivot {
            right.append(element)
        } else {
            middle.append(element)
        }
    }
    
    while (left.count < nbItemLeft && middle.count > 0) {
        left.append(middle.removeLast());
    }
    
    while (middle.count > 0) {
        right.append(middle.removeLast());
    }
    
    if left.count > nbItemLeft {
        let sub: (left: [T], right: [T])
            = split(&left, nbItemLeft, nbItemRight - right.count)
        return (sub.left, right + sub.right)
    } else if right.count > nbItemRight {
        let sub: (left: [T], right: [T])
            = split(&right, nbItemLeft - left.count, nbItemRight)
        return (left + sub.left, sub.right)
    } else {
        return (left, right)
    }
}

internal extension Array {
    
    func splitByMedian<T>() -> ([T], [T]) where T: Comparable {
        let mid = count / 2
        var array: Array<T> = self.map {
            return $0 as! T
        }
        return VPTree.split(&array, count-mid, mid)
    }
    
}
