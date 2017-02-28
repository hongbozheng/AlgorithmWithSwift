//
//  main.swift
//  SwiftAlgorithm
//
//  Created by hongbozheng on 2/22/17.
//  Copyright © 2017 fiu. All rights reserved.
//

import Foundation

print("Hello, World!")

 class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // var res = Array(repeating:0,count:2)
        var res = [Int]()
        // if (nums == nil || nums.count == 0 ) { return res }
        var dict = [Int:Int]()
        
        
        for i in 1..<nums.count{
            
        }
        
        return res
    }
    
    func levelOrder(_ root:TreeNode?) -> [[Int]] {
         guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [TreeNode]()
//        var q :[TreeNode] = [root]
        queue.removeLast()
        queue.popLast()
        queue.append(root)
//        q.isEmpty
        while queue.count != 0 {
            var tmpArr = [Int]()
            let size = queue.count
            for _ in 0..<size {

                let tmpNode =  queue.removeFirst()
                tmpArr.append(tmpNode.val)
                if  tmpNode.left != nil {
                    queue.append((tmpNode.left)!)
                }
                if tmpNode.right != nil {
                    queue.append((tmpNode.right)!)
                }
            }
            res.append(tmpArr)
        }
        
        return res
    }
    
    func preorderTree(_ root:TreeNode?) -> [Int] {
        guard let root = root else { return []}
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {

//            let tmpNode = stack.popLast()
            let tmpNode = stack.removeLast()
            res.append(tmpNode.val)
            if let rightNode = tmpNode.right {
                stack.append(rightNode)
            }
            if let leftNode = tmpNode.left {
                stack.append(leftNode)
            }
            
        }
        return res
    }
    
    func inorderTraversal(_ root:TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var stack = [TreeNode]()
        var curtNode:TreeNode? = root
        while curtNode != nil || !stack.isEmpty {
            while curtNode != nil {
                stack.append(curtNode!)
                curtNode = curtNode!.left
            }

//            while let tmpcurtNode = curtNode {
//                    stack.append(tmpcurtNode)
//                    curtNode = tmpcurtNode.left
//            }
            let tmpNode = stack.removeLast()
            res.append(tmpNode.val)
            curtNode = tmpNode.right
        }
        return res

    }
    
    func reverseString(_ s:String?) -> String {
        guard var s = s else { return ""}
//       s =  s.trimmingCharacters(in: CharacterSet.whitespaces)
        if s.characters.count == 0 {
            return ""
        }
        var arr = Array(s.characters)
        var low = 0
        var high = arr.count.hashValue - 1
        for _ in 0..<s.characters.count.hashValue/2 {
             let tmp = arr[low]
            arr[low] = arr[high]
            arr[high] = tmp
            low += 1
            high -= 1
        }
        return String(arr)
    }
    
    func mergeTwoSortedArray(_ nums1: inout [Int], _ m: Int, _ nums2:[Int], _ n:Int ){
        var tmpNums1:[Int] = []
        tmpNums1.append(contentsOf: nums1)
        
        var i = 0
        var j = 0
        var k = 0
        while i < m && j < n {
            if tmpNums1[i] > nums2[j] {
                nums1[k] = nums2[j]
                j += 1
                 k += 1
            }else{
                nums1[k] = tmpNums1[i]
                i += 1
                 k += 1
            }
           
        }
        
        while i<m {
            nums1[k] = tmpNums1[i]
            k += 1
            i += 1
        }
        while j<n {
            nums1[k] = nums2[j]
            j += 1
            k += 1
        }
        
        
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {return nums.count}
        var len = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                nums[len] = nums[i]
               len += 1
            }
        }
               return len
    }
    
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        var i = 0
        for n in nums {
            if i<2 || n>nums[i-2] {
                nums[i] = n
                i += 1
            }
        }
        return i
    }
//    [-2,1,-3,4,-1,2,1,-5,4]
    func maxSubArray(_ nums:[Int]) -> Int {
        var maxSum = nums[0]
        var sum = nums[0]
        for i in 1..<nums.count {
            sum = max(nums[i], sum + nums[i])
            maxSum = max(maxSum, sum)
        }
        return maxSum
    }
    
    func twoSumII(_ nums:[Int],_ target:Int) -> [Int] {
        if nums.count < 2 {return nums}
        var res = [Int]()
            var low = 0
            var high = nums.count - 1
            while low<high {
                let v = nums[low] + nums[high]
                if v == target {
                 res.append(low + 1)
                    res.append(high + 1)
                    return res
                }else if v > target {
                    high -= 1
                }else {
                    low += 1
                }
            }
        return res
    }
    
    
    func intersectionOfTwoArray(_ nums1:[Int], _ nums2:[Int]) -> [Int] {
        var set1 = Set<Int>()
        var set2 = Set<Int>()
        for n1 in nums1 {
            set1.insert(n1)
        }
        for n2 in nums2 {
            if set1.contains(n2){
                set2.insert(n2)
            }
        }
        return Array(set2)
    }
    
    func intersectionArrayII(_ nums1:[Int], _ nums2:[Int]) -> [Int] {
        var res:[Int] = []
        
        var dict1 = Dictionary<Int,Int>()
        for num in nums1 {
            if dict1[num] != nil {
                dict1[num]! += 1
            }else {
                dict1[num] = 1
            }
        }
        for num in nums2 {
            if dict1[num] != nil && dict1[num]! > 0{
                res.append(num)
                dict1[num]! -= 1
            }
        }
        return res
    }
    //[4,3,2,7,8,2,3,1]
    func findDisappearedNumbers(_ nums: [Int]) ->[Int]{
         var nums = nums
        if nums.count == 0 {return []}
        var res :[Int] = []
        for i in 0..<nums.count {
            let val = abs(nums[i]) - 1
            if nums[val] > 0 {
                nums[val] = -nums[val]
            }
            
        }
        for i in 0..<nums.count {
            if nums[i] > 0 {
            res.append(i + 1)
            }
        }
        return res
    }
    func roateArray(_ nums: inout [Int], _ k:Int) {
        let n = nums.count
        let k = k%n
        reverseArray(&nums, 0, n - k - 1)
        reverseArray(&nums, n - k, n - 1)
        reverseArray(&nums, 0, n - 1)
    }
    
    func reverseArray(_ nums:inout [Int], _ low:Int , _ high:Int){
        var i = low
        var j = high
        while i<j {
            swap(&nums[i], &nums[j])
            i += 1
            j -= 1
        }
    }
    //bab abb
    func isIsomorphic(_ s:String, _ t:String) -> Bool {
        var sCountArr = Array(repeating: 0, count: 256)
        var tCountArr = Array(repeating: 0, count: 256)
//        var sArr = Array(s.utf8)
//        var tArr = Array(t.utf8)
        
        for (i,e) in s.utf8.enumerated() {
            if sCountArr[e.hashValue] != tCountArr[e.hashValue] {
                return false
            }
            sCountArr[e.hashValue] = i + 1
            tCountArr[e.hashValue] = i + 1
        }
        
//        for i in 0..<sArr.count {
//            if sCountArr[sArr[i].hashValue] != tCountArr[tArr[i].hashValue] {
//                return false
//            }
//           sCountArr[sArr[i].hashValue] = i + 1
//           tCountArr[tArr[i].hashValue] = i + 1
//            
//        }
//        swap(&sCountArr, &<#T##b: T##T#>)
//        String(sCountArr)
        return true
    }
    
    func reverseVowels(_ s:String) -> String {
        if s.characters.count == 0 {return ""}
        let vowelstr = "aeiouAEIOU"
        var start = 0
        var end = s.characters.count - 1
        var sArr = Array(s.characters)
        while start < end {
            while start<end && !vowelstr.contains(String(sArr[start])){
                start += 1
            }
            while start<end && !vowelstr.contains(String(sArr[end])) {
                end -= 1
            }
            swap(&sArr[start],&sArr[end])
            start += 1
            end -= 1
        }
        return String(sArr)
    }
    
    func addStrings(_ num1:String, _ num2:String) -> String {
                
        var num1arr = Array(num1.characters)
        var num2arr = Array(num2.characters)
        var i = num1arr.count - 1
        var j = num2arr.count - 1
        var carry = 0
        var res:[Int] = []
        while i > -1 && j > -1 {
            let val = carry + Int(String(num1arr[i]))! + Int(String(num2arr[j]))!
            res.append(val%10)
            carry = val/10
            i -= 1
            j -= 1
        }
        while i > -1 {
            let val = carry + Int(String(num1arr[i]))!
            res.append(val%10)
            carry = val/10
            i -= 1
            
        }
        while j > -1 {
            let val = carry + Int(String(num2arr[j]))!
            res.append(val%10)
            carry = val/10
            j -= 1
        }
        if carry != 0 {
            res.append(carry)
        }
        var resStr = ""
        for num in res.reversed() {
            resStr += String(num)
        }
        return resStr
    }
}

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val:Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

 let s = Solution()
 let node = TreeNode.init(1)
node.left = TreeNode.init(2)
//let res = s.preorderTree(node)
//let res = s.inorderTraversal(node)
//let res = Solution.preorderTree(node)
// let res = s.reverseString(" ")

//var x = [1,2,3,4,5,0,0]
//let y = [8,9]
//s.mergeTwoSortedArray(&x, 5, y, 2)
//print(x)

var x = [1,1]
var y = [1]
//x = [1,2]
//x = [-2,1,-3,4,-1,2,1,-5,4]
//let res = s.removeDuplicates(&x)
//let res = s.removeDuplicatesII(&x)
//let res = s.maxSubArray(x)
//let res = s.twoSumII(x, 7)
//let res = s.intersectionOfTwoArray(x, y)
//s.roateArray(&x, 3)
//let res = s.intersectionArrayII(y, x)
x = [4,3,2,7,8,2,3,1]
//let res = s.findDisappearedNumbers(x)
//print(x)
//print(max(2, 4))
//for i in 0...5 {
////    i = 4
//    print(i)
//}
//for i in (0...9-1).reversed(){
//    print(i)
//}
//print(Int("1")!)
//print("Z".unicodeScalars.first!.hashValue)
let sStr = "0"
let tStr = "0"
//let res = s.isIsomorphic(sStr, tStr)

let res = s.addStrings(sStr, tStr)
print(res)
//let strNum:[Character] = ["2","1","3"]

