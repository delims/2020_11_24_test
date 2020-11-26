//
//  main.cpp
//  11_24_macos_cpp
//
//  Created by delims on 2020/11/24.
//

#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>


using namespace::std;

/* 知识点
这样初始化数组。这样返回的数组存储的都是0
 int *arr = new int[100]();

 //后面的大括号的元素给数组前面的元素依次复制。个数不够，数组元素为0
 int array[30] = {NULL};


 
 
 */


int main(int argc, const char * argv[]) {
    // insert code here...
    
    // 初始化数组。
//    int *arr = new int[100]();
    
    
//    int array[30] = {NULL};
    
//    cout << NULL <<endl;
    
    int a = 2;
    a ++;
    a ++;
    a ++;
    
    string str= "123";
    
    cout << str.length() <<endl;

    cout << str.compare("129") <<endl;
    
    vector<int> ints = {1,2,3,5};
    
    ints.push_back(123);
    ints.push_back(234);
    
    cout << ints.size() <<endl;
    
    for (int i = 0; i < ints.size(); i ++) {
        cout<< ints[i] <<endl;
    }
    
    
    
//    cout<< arr[0] <<endl;
//    cout<< arr[1] <<endl;
//    cout<< arr[2] <<endl;

//    cout << sizeof(1) <<endl;
    
//    for (int i = 0; i < sizeof(array) / sizeof(int); i++){
//        cout << array[i]<<endl;
//    }
    
    
    return 0;
}

class Solution {
public:
    vector<int> findSubstring(string s, vector<string>& words) {
        vector<int> ret;
        if(words.size() == 0)//判断words为空,因为下面用到了words[0]
            return ret;
        
        int word_size = words[0].size();
        int word_num = words.size();
        
        unordered_map<string,int> m1;//构造hashmap
        for(int i=0;i<word_num;i++)
            m1[words[i]]++;
        
        unordered_map<string,int> m2;
        for(int i=0; (i + word_size * word_num) <= s.size() ; i++){//截取的s符合题意
            int j = 0;
            for(j=i;j < (i + word_size * word_num) ; j=j+word_size){//分段判断
                string temp_str = s.substr(j,word_size);
                if(m1[temp_str] == 0){//m1中没有截取的串，直接跳出
                    break;
                }else{
                    m2[temp_str]++;
                    if(m1[temp_str] < m2[temp_str])//重复次数过多，也跳出
                        break;
                }
            }
            
            if(j == (i + word_size * word_num))//每一段都符合，则加入答案
                ret.push_back(i);
            
            m2.clear();//清空m2
        }
        return ret;
    }
};
