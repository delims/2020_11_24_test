//
//  ViewController.h
//  TestForwardingSelector
//
//  Created by delims on 2021/4/9.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)aaa:(int)a;
+ (void)aaa:(int)a :(int)b;
@end

