//
//  main.m
//  12_14_binary_to_0101
//
//  Created by delims on 2020/12/14.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

void f()
{
    
}

static int abc;
static int abcd = 120;

int main(int argc, const char * argv[]) {
    
    NSLog(@"function address %p",f);
    NSLog(@"function address %p",main);
    NSLog(@"static  address1 %p",&abc);
    NSLog(@"static  address2 %p",&abcd);

    unsigned long p1 = (unsigned long) f;
    unsigned long p2 = (unsigned long) main;

    
    
    
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    if (argc <= 1) {
        printf("no file !\n");
    }
    
    for (int i = 1; i < argc; i ++) {
        char const *path = argv[i];
        FILE *fp = fopen(path, "r");
        char const *dest = strcat((char *)path, ".jpg");
        FILE *infp = fopen(dest, "w");
        unsigned char buffer[8];
        unsigned char binary[1];
        size_t readcount = 0;
        while (!feof(fp)) {
            readcount = fread(buffer, 1, 8, fp);
            unsigned char byte = 0;
            for (int i = 0; i < readcount;i ++) {
                int offset = 7 - i;
                byte += buffer[i] == '1' ? (1<<offset) : 0;
            }
            binary[0] = byte;

            fwrite(binary, 1, 1, infp);
        }

        fclose(fp);
        fclose(infp);

    }
    
    
//    for (int i = 1; i < argc; i ++) {
//        char const *path = argv[i];
//        FILE *fp = fopen(path, "rb");
//        char const *dest = strcat((char *)path, ".txt");
//        FILE *infp = fopen(dest, "wt");
//        unsigned char buffer[8];
//        unsigned char binary[64];
//        size_t readcount = 0;
//        while (!feof(fp)) {
//            readcount = fread(buffer, 1, 8, fp);
//            for (int i = 0;i < readcount * 8;i ++) {
//                int index = i / 8;
//                int offset = i % 8;
//                bool bit = (buffer[index] >> (7-offset)) & 1;
//                binary[i] = bit ? '1' : '0';
//    //                if (i && offset == 0) {
//    //                    fwrite(" ", 1, 1, infp);
//    //                }
//            }
//            fwrite(binary, 1, readcount * 8, infp);
//        }
//
//        fclose(fp);
//        fclose(infp);
//
//    }
    
    
    
    return 0;
}




