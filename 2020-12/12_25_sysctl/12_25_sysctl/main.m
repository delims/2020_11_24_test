//
//  main.m
//  12_25_sysctl
//
//  Created by delims on 2020/12/25.
//

#import <Foundation/Foundation.h>
#import <sys/sysctl.h>

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//
    
//    size_t size = sizeof(int);
//    unsigned int results;
//    int mib[2] = {CTL_HW, HW_PHYSMEM};
//    sysctl(mib, 2, &results, &size, NULL, 0);
//
//    NSLog(@"%u",results / 1024 / 1024 );
    
    
    FILE *fp = fopen("/Users/delims/Desktop/1", "wb");
    unsigned char wocao[5];
    wocao[0] = 245;
    wocao[2] = 200;
    wocao[3] = 198;
    wocao[4] = 178;
    
    fwrite(wocao, 4, 1, fp);
    fclose(fp);
    
    
    return 0;
}
