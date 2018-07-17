//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTowNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var r_l1: ListNode? = nil
    var curr_l1: ListNode = l1!
    
    while curr_l1 != nil {
        let tmp = curr_l1.next
        
        curr_l1.next = r_l1
        r_l1 = curr_l1
        curr_l1 = tmp!
    }
    
    
    
    return nil
}

