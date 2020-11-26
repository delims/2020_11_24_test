//
//  main.cpp
//  11_23
//
//  Created by delims on 2020/11/23.
//

#include <iostream>

#include <Foundation/Foundation.h>

using namespace std;

//class CTest
//{
//    public:
////        CTest():m_chData('\0'),m_nData(0)
////        {
////        }
////        virtual void mem_fun(){}
////    virtual void f(){};
//    private:
//        char m_chData;
//        int m_nData;
//        static char s_chData;
//};
//char CTest::s_chData='\0';




int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
    
    int a[3] = {0};
    
    
    cout<< a[0] << a[1] << a[2] << sizeof(a) / sizeof(int)<<endl;
    
    char c[] = "a";
    
    
    int *p2 = new int[10]();
    
    
    __block int i = 0;
    
    for (int j = 0;j < 100; j ++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            i ++;
        });
    }

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
       
        NSLog(@"%d",i);
    });
    
    
    
//    cout<<sizeof(CTest)<<endl;
 
    getchar();
    return 0;
}
