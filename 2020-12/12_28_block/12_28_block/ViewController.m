//
//  ViewController.m
//  12_28_block
//
//  Created by delims on 2020/12/28.
//

#import "ViewController.h"

int c = 0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int a = 0;
    
     __unsafe_unretained void (^block)(void) = ^{
        int b = a;
        NSLog(@"我是一个block");
    };
    
    NSLog(@"%@",block);
    
    // Do any additional setup after loading the view.
}


@end
