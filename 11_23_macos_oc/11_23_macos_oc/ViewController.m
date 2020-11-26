//
//  ViewController.m
//  11_23_macos_oc
//
//  Created by delims on 2020/11/23.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int nums[] = {2,3,6,1,9,3,8,5,6,7,9,4,3,4};
    int count = sizeof(nums) / sizeof(int);
    
    int result[3] = {0};
    for (int i = 0;i < count; i ++) {
        if (nums [i]  > result[0] && i < count - 2) {
            result[0] = nums[i];
            result[1] = 0;
            result[2] = 0;
        } else if (nums[i] > result[1] && i < count - 1) {
            result[1] = nums[i];
            result[2] = 0;
        } else if (nums[i] > result[2]){
            result[2] = nums[i];
        }
        
    }
    

    
    
    

   
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
