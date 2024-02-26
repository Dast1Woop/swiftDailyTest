//
//  ViewController.m
//  testXcFramework
//
//  Created by LongMa on 2024/2/23.
//

#import "ViewController.h"
@import MYAppDefendKit;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"isJailBreakDevice:%d",[MYAppDefend isJailBreakDevice]);
    NSLog(@"isUsingProxyOrVPN:%d",[MYAppDefend isUsingProxyOrVPN]);
    NSLog(@"isDebuggerAttachedApartFromXcode:%d",[MYAppDefend isDebuggerAttachedApartFromXcode]);
}


@end
