//
//  SSSliderVC.m
//  SSMenuSlider
//
//  Created by Susim on 11/6/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "SSSliderVC.h"
@interface SSSliderVC ()

@end

@implementation SSSliderVC
- (id)initWithDataSource:(id)object onEventCompletion:(EventCompletionHandler )handler {
    if(self = [super init]) {
        eventCompletionHandler = handler;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSliderSetUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setSliderSetUp {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(goToMenu:)];
    self.navigationController.view.frame = CGRectMake(self.view.frame.size.width*0.80, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
	[self addPanGesture];
}
- (void)goToMenu:(id)sender {
    if (eventCompletionHandler) {
        eventCompletionHandler (nil);
    }
}
- (void)addPanGesture {
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGestureRecognizer.minimumNumberOfTouches = 1.0;
    self.view.userInteractionEnabled = YES;
    [self.navigationController.view addGestureRecognizer:panGestureRecognizer];
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x, recognizer.view.center.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    if (recognizer.state == UIGestureRecognizerStateEnded ) {
        CGRect rect = self.view.frame;
        if (recognizer.view.frame.origin.x > self.view.frame.size.width/2) {
            rect.origin.x = rect.size.width *0.80;
        }else {
            rect.origin.x = 0.0;
        }
        [UIView animateWithDuration:0.3 animations:^(void){
        	self.navigationController.view.frame = rect;
        }];
    }
}
@end
