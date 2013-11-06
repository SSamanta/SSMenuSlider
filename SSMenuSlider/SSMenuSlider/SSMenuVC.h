//
//  SSMenuVC.h
//  SSMenuSlider
//
//  Created by Susim on 11/6/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EventCompletionHandler)(id object);
@interface SSMenuVC : UIViewController {
    EventCompletionHandler eventCompletionHandler;
}
- (id)initWithDataSource:(id)object onEventCompletion:(EventCompletionHandler)handler;
@end
