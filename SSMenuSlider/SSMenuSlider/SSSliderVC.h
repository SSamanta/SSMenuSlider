//
//  SSSliderVC.h
//  SSMenuSlider
//
//  Created by Susim on 11/6/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSMenuVC.h"
@interface SSSliderVC : UIViewController {
    EventCompletionHandler eventCompletionHandler;
}
- (id)initWithDataSource:(id)object onEventCompletion:(EventCompletionHandler )handler;
@end
