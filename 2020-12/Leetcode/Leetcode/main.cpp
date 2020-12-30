//
//  main.cpp
//  leetcode
//
//  Created by delims on 2020/12/22.
//

#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}


struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
   vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
       vector<vector<int>> ret;
       bool posSeq = true;
       vector<TreeNode*> current;
       current.push_back(root);
       vector<int> intVector;
       intVector.push_back(root->val);
       ret.push_back(intVector);
       
       while (current.size()) {
           posSeq = !posSeq;
           vector<TreeNode *> next;
           for (int i = 0 ; i < current.size(); i ++) {
               TreeNode *node = current[i];
               if (posSeq) {
                   next.push_back(node->left);
                   next.push_back(node->right);
               } else {
                   next.push_back(node->right);
                   next.push_back(node->left);
               }
           }
           current = next;
           intVector.clear();
           for (int i = 0 ; i < current.size();i ++){
               intVector.push_back(current[i]->val);
           }
           ret.push_back(intVector);

       }
       return ret;
   }
};
