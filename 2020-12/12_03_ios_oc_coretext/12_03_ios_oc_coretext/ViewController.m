//
//  ViewController.m
//  12_03_ios_oc_coretext
//
//  Created by delims on 2020/12/3.
//

#import "ViewController.h"

@interface CoreTextView : UIView

@end

@implementation CoreTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSLog(@"调用了drawrect");
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CoreTextView *view = CoreTextView.new;
    view.frame = CGRectMake(10, 100, 200, 200);
    [self.view addSubview:view];
    self.view.backgroundColor = UIColor.grayColor;
}


@end
