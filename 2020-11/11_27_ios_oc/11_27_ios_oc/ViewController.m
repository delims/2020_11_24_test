//
//  ViewController.m
//  11_27_ios_oc
//
//  Created by delims on 2020/11/27.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface delimsLabel : UILabel


@end

@implementation delimsLabel

- (CGSize)sizeThatFits:(CGSize)size
{
    NSLog(@"%@",NSStringFromCGSize(size));
    CGSize retsize = [super sizeThatFits:size];
    NSLog(@"%@",NSStringFromCGSize(retsize));
    return  retsize;
    
}

@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController {
    UIImageView *_imageView;
}


char *revert_string(char *str)
{
    char *p1 = str;
    char *p2 = str + strlen(str) -1;
    char temp;
    while (p2 > p1) {
        temp = *p1;
        *p1 = *p2;
        *p2 = temp;
        p1 ++;
        p2 --;
    }
//    NSLog(@"%c--%c", *p1, *p2);
    return str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    char s[] = "hellow,delims";
    char *s1 = "hellow,delims";
//    revert_string(s);
    
    NSLog(@"%p",s);
    NSLog(@"%p",s1);

//    NSLog(@"%s",revert_string(s));
    
    delimsLabel *label = delimsLabel.new;
    
//    label.text = @"You can configure the overall appearance of a label's text, and use attributed strings to customize the appearance of substrings within the text. Add and customize labels in your interface programmatically or with the Attributes inspector in Interface Builder.You can configure the overall appearance of a label's text, and use attributed strings to customize the appearance of substrings within the text. Add and customize labels in your interface programmatically or with the Attributes inspector in Interface Builder.";
    
    label.attributedText = [NSAttributedString.alloc initWithString:@"\uFFFC"];
    
    label.backgroundColor = UIColor.grayColor;
    label.textColor = UIColor.blueColor;
    label.numberOfLines = 0;
 
    [self.view addSubview:label];
    
    label.frame = CGRectMake(10, 150, 180, 200);
    
    [label sizeToFit];
    
    NSLog(@"result = %@",NSStringFromCGRect(label.frame));
    
    UIView *view = UIView.new;
    view.frame = CGRectMake(100, CGRectGetMaxY(label.frame) + 10, 50, 50);
    view.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:view];
    
    
    NSLog(@"%d",pthread_main_np());
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%d",pthread_main_np());
    });
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//
////        [label sizeThatFits:CGSizeMake(100, CGFLOAT_MAX)];
//        [label sizeToFit];
//
//        NSLog(@"result = %@",NSStringFromCGRect(label.frame));
//    });
    
    UITableView *table = [UITableView.alloc initWithFrame:self.view.bounds];
    [self.view addSubview:table];
    
    [table registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    
    table.delegate = self;
    table.dataSource = self;
    table.delaysContentTouches = NO;
    table.canCancelContentTouches = NO;
//    table.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    

    if (cell.contentView.subviews.count < 2) {
        UITextField *textfield = UITextField.alloc.init;
        textfield.frame = CGRectMake(10, 2, 400, 40);
        textfield.backgroundColor = UIColor.lightGrayColor;
        [cell.contentView addSubview:textfield];
        
        UIButton *button = UIButton.alloc.init;
        button.frame = CGRectMake(0, 0, 40, 40);
        button.backgroundColor = UIColor.greenColor;
        [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button];
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;;
}


- (void)clicked:(UIButton*)sender;
{
  
    NSLog(@"点击了");
}


- (id)content
{
    if (pthread_main_np() == 0) return nil;
    if (_imageView) return _imageView;
    _imageView = [UIImageView alloc].init;
    return _imageView;
}

@end
