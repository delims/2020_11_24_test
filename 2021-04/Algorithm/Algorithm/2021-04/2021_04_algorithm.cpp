//
//  2021_04_algorithm.cpp
//  Algorithm
//
//  Created by delims on 2021/4/15.
//

#include "2021_04_algorithm.hpp"
#include <vector>
#include <math.h>
using namespace std;

//打家劫舍
//class Solution {
//public:
//    int rob(vector<int>& nums) {
//        if (nums.size() == 0) return 0;
//        if (nums.size() == 1) return nums[0];
//        unsigned long size = nums.size();
//        vector<int> dp = vector<int>(size,0);
//        dp[0] = nums[0];
//        dp[1] = max(nums[0], nums[1]);
//        for (int i = 2 ;i < size; i ++) {
//            dp[i] = max(dp[i-2] + dp[i], dp[i-1]);
//        }
//
//        return dp[size - 1];
//    }
//};

//class Solution {
//public:
//    int rob(vector<int>& nums) {
//        if (nums.empty()) return 0;
//        unsigned long size = nums.size();
//        if (size == 1) return nums[0];
//        if (size == 2) return max(nums[0], nums[1]);
//        vector<int> dp = vector<int>(size,0);
//        dp[0] = nums[0];
//        dp[1] = max(nums[0],nums[1]);
//        for (int i = 2; i < size - 1; i ++) {
//            dp[i] = max(dp[i-2] + nums[i], dp[i-1]);
//        }
//        int first = dp[size-2];
//        dp[1] = nums[1];
//        dp[2] = max(nums[2],nums[1]);
//        for (int i = 3; i < size ; i ++) {
//            dp[i] = max(dp[i-2] + nums[i], dp[i-1]);
//        }
//        int second = dp[size-1];
//        return max(first, second);
//    }
//};
