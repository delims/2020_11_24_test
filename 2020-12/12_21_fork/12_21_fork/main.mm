//
//  main.m
//  12_21_fork
//
//  Created by delims on 2020/12/21.
//

#import <Foundation/Foundation.h>
#import <vector>

int main(int argc, const char * argv[]) {
    
    pid_t ret = fork();
    printf("%d\n",ret);
    
    return 0;
}


