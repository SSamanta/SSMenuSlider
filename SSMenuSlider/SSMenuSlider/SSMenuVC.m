//
//  SSMenuVC.m
//  SSMenuSlider
//
//  Created by Susim on 11/6/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "SSMenuVC.h"

@interface SSMenuVC ()
@property (strong,nonatomic) NSArray* dataSource;
@end

@implementation SSMenuVC

- (id)initWithDataSource:(id)object onEventCompletion:(EventCompletionHandler)handler {
    if (self = [super init]) {
        eventCompletionHandler = handler;
        self.dataSource =  object;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table View Data Source 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataSource [indexPath.row];
    return cell;
}
#pragma mark Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = self.dataSource[indexPath.row];
    if (eventCompletionHandler) {
        eventCompletionHandler(object);
    }
}
@end
