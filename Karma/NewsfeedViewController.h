//
//  NewsfeedViewController.h
//  Karma
//
//  Created by Simon Orlovsky on 9/26/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsfeedViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
-(void)reloadDataTable;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
