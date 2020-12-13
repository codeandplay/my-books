# Two Sum II - Input array is sorted (Easy)

## Question

[Leetcode link][1]

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.\
The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.\

**Note**:\

- Your returned answers (both index1 and index2) are not zero-based.
- You may assume that each input would have exactly one solution and you may not use the same element twice.


## Solution
Because array of integers are sorted in ascending order. The problem can be solved by using **Double pointers**. We can create two pointers that point to the index of the array of integers: *p1* and *p2*.
Next we need to the sum of the the integers the two pointers point at. There would three possible cases:
- sum == target. We found our index
- sum > target. Sum too large, we move *p2* toward the left.
- sum < target. Sum too small. we move *p1* toward the right.

```rust
impl Solution {
    pub fn two_sum(numbers: Vec<i32>, target: i32) -> Vec<i32> {
        let mut ptr_start = 0;
        let mut ptr_end = numbers.len() - 1;
        
        loop {
            let sum = &numbers[ptr_start] + &numbers[ptr_end];              
            if sum == target {
               break; 
            }
            
            if sum > target {
               ptr_end -= 1 
            } else {
               ptr_start += 1 
            }
        }
        
        vec![(ptr_start + 1) as i32, (ptr_end + 1) as i32]
    }
}
```

[1]: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
