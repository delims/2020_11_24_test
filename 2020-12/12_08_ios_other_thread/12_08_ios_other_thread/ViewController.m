//
//  ViewController.m
//  12_08_ios_other_thread
//
//  Created by delims on 2020/12/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    
    UILabel *view = UILabel.new;
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:view];
    
    view.layer.cornerRadius = 30;
    
    view.layer.shadowOffset = CGSizeMake(100, 100);
    view.layer.shadowColor = UIColor.blueColor.CGColor;
    view.layer.shadowRadius = 0;
    view.layer.shadowOpacity = 1;
    const CGAffineTransform form = CGAffineTransformRotate(view.transform, M_PI_2);
    CGPathRef *path = CGPathCreateWithRect(view.frame, &form);
    
    view.layer.shadowPath = path;
    view.layer.contentsScale = 3;
    view.text = @"test";
    view.textColor = UIColor.whiteColor;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
       
        
        
    });
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
}

@end
