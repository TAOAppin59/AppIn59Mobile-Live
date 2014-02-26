//
//  ViewController.m
//  AppInFiftyNine
//
//  Created by Dee Madden on 2/25/14.
//  Copyright (c) 2014 Dee Madden. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
  self.webView.scrollView.showsVerticalScrollIndicator = NO;
  self.webView.scrollView.showsHorizontalScrollIndicator = NO;
  
  NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"app/index" ofType:@"html"];
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath isDirectory:NO]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
