//
//  main.m
//  02-04-singleapp
//
//  Created by delims on 2021/2/4.
//

#import <Foundation/Foundation.h>
#import <sys/sysctl.h>
#import <sys/syscall.h>
#import <sys/types.h>
#import <unistd.h>

int main(int argc, const char * argv[]) {
    
    
//    extern "C"
//    {
//        const char *lockfile = "/usr-data/.gateway";
//        int ret = open(lockfile,O_RDWR|O_CREAT);
//        if (flock(ret, LOCK_EX | LOCK_NB) == -1) {
//            printf("there is an app running \n");
//            exit(0);
//        }
//    }

    int ret = open("/Users/delims/Desktop/AgFarmGateway-0.8.7", O_RDWR|O_CREAT);
    
//    printf("LOCK_NB ret = %i \n",flock(ret, LOCK_EX | LOCK_NB));
    
    int result = syscall(SYS_flock,ret,LOCK_EX | LOCK_NB);
    
    
    
    printf("== %i\n",result);

    printf("%i\n",ret);
    
    getchar();
    
    return 0;
}

