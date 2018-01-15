//: Using binary search to check if a number in an array

let numbers = [1, 4, 6, 7, 10, 12, 18, 19, 23, 24, 34, 44, 58, 65]

func binarySearch(array: [Int], key: Int) -> Bool {
    
    if array.count == 0 {return false}
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        print("\(key) is not in the array")
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex+1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex-1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    return false
}

binarySearch(array: numbers, key: 18)
