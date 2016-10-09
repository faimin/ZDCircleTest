//
//  ViewController.m
//  ZDTest
//
//  Created by 符现超 on 16/4/15.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "ViewController.h"
#import "ZDCircleView.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZDCircleView *circleView;
@property (nonatomic, strong) UIView *aView;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = CGRectMake(20, 50, 100, 80);
    UIEdgeInsets ed = UIEdgeInsetsMake(-3, -4, -5, -6);
    CGRect  r =  UIEdgeInsetsInsetRect(rect, ed);
    NSLog(@"%@", [NSValue valueWithCGRect:r]);
    
	self.aView = ({
		UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
		aView.backgroundColor = [UIColor redColor];
		[self.view addSubview:aView];
		aView;
	});

    NSArray *arrTemp = @[@"1", @"2", @"3", @"4", @"5", @"1", @"2"];
    NSArray *newArr = [arrTemp sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"\n---> %@", newArr);
    
	dispatch_group_t group = dispatch_group_create();
	dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

	for (int i = 0; i < 100; i++) {
		//信号量减1,如果同时开启10个以上的线程，则信号量小于等于0，此时就会阻塞该线程。
		dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
		dispatch_group_async(group, queue, ^{
			NSLog(@"test %d", i);
			//每个线程执行减1后通过信号量通知加1，这样始终保持线程在10个之内
			dispatch_semaphore_signal(semaphore);
		});
	}

	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)changeAnchorPoint:(id)sender
{
	NSLog(@"position1 = %@", [NSValue valueWithCGPoint:self.aView.layer.position]);
	NSLog(@"layerFrame1 = %@", [NSValue valueWithCGRect:self.aView.layer.frame]);
	self.aView.layer.anchorPoint = (CGPoint) {0.5, 1};
	NSLog(@"position2 = %@", [NSValue valueWithCGPoint:self.aView.layer.position]);
	NSLog(@"layerFrame2 = %@", [NSValue valueWithCGRect:self.aView.layer.frame]);

	[UIView animateWithDuration:3.f animations:^{
		self.aView.layer.position = (CGPoint) {200, 250};
	}];
}

@end
