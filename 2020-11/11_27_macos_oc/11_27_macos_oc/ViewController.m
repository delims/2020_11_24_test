//
//  ViewController.m
//  11_27_macos_oc
//
//  Created by delims on 2020/11/27.
//

#import "ViewController.h"

@interface ViewController()

@property (nonatomic,strong) int(^blk)(int);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block int multiplier = 10;

    int (^block)(int) =  ^(int num){
        return num * multiplier;
//        return num;
    };

    self.blk = block;

    multiplier = 4;

    // Do any additional setup after loading the view.
    
 


    
}

- (void)viewDidAppear
{
    [super viewDidAppear];
    
    NSLog(@"result = %i",self.blk(2));
    
    __block int age = 1;
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };

    void (^block2)(void) = ^{
        NSLog(@"block2:%d",age);
    };

    NSLog(@"%@/%@/%@",[block1 class],[block2 class],[^{
        NSLog(@"block3:%d",age);
    } class]);
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
