//
//  main.m
//  11_30_macos_c_readfile
//
//  Created by delims on 2020/11/30.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    
    
    FILE *fp = fopen("/Users/delims/Desktop/1.jpeg", "r");
    
    printf("%p \n",fp);
    
//    printf("%i \n",fseek(fp, 0, SEEK_END));
    
//    printf("%i \n",SEEK_END);
    
//    long size = ftell(fp);
    
//    printf("文件大小 %lu \n",size);
    
    unsigned char buffer[0x20] = {0};
    size_t len = 0;
    
    while (!feof(fp)) {
        len = fread(buffer, 1, sizeof(buffer), fp);
        for (int i = 0; i < len; i++) {
            unsigned char temp = buffer[i];
            printf("%02x",temp);
        }
        printf("\n");
    }
    

    
    
    
    
     

    getchar();getchar();getchar();getchar();getchar();
    printf(" \n\n\n\n\n\n");

    return 0;
}
