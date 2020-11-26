//
//  ViewController.m
//  11_24_ios_oc
//
//  Created by delims on 2020/11/24.
//

#import "ViewController.h"



@interface ViewController ()

- (void)func;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self func];
    
    UIView *view = UIView.new;
    view.backgroundColor = UIColor.redColor;
    
    view.frame = CGRectMake(20, 200, 100, 100);
    [self.view addSubview:view];
    
    view.layer.cornerRadius = 20;
    view.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view.
}

- (void)func
{
    NSLog(@"原方法");
}

@end


@interface ViewController (Delims)

@end

@implementation ViewController (Delims)



@end
