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
//        var res: [Int] = []
//        var stack: [TreeNode] = []
//        var curr: TreeNode? = root
//        while curr != nil || stack.isEmpty == false {
//            while let unwrapped = curr {
//                stack.append(unwrapped)
//                curr = curr?.left
//            }
//            let last: TreeNode = stack.removeLast()
//            res.append(last.val)
//            curr = last.right
//        }
//        return res
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

var x = [1,1,2,3,4,5,5,6]
x = [1,2]
x = [1,1,1,2,2,3,3,3,3,3,3]
//let res = s.removeDuplicates(&x)
let res = s.removeDuplicatesII(&x)
print(x)
//for i in 0...5 {
////    i = 4
//    print(i)
//}
print(res)
