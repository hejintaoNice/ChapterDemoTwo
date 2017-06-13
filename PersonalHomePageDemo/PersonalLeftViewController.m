//
//  PersonalLeftViewController.m
//  PersonalHomePageDemo
//
//  Created by Kegem Huang on 2017/3/15.
//  Copyright © 2017年 huangkejin. All rights reserved.
//

#import "PersonalLeftViewController.h"
#import "LeftContentDescTableViewCell.h"
@interface PersonalLeftViewController ()

@end

@implementation PersonalLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    TableViewNOXIBRegisterCell(self.tableView, LeftContentDescTableViewCell, @"LeftContentDescTableViewCell_id")
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     LeftContentDescTableViewCell *cell = (LeftContentDescTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
     CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
     CGSize textViewSize = [cell.desc sizeThatFits:CGSizeMake(SCREEN_WIDTH-24, FLT_MAX)];
     CGFloat height = textViewSize.height + size.height;
     return height + 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftContentDescTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftContentDescTableViewCell_id" ];
    [cell config:@"duagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasidduagduiasbiuashbdioasbdiusbduiabsdbasid"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击left-%d",(int)indexPath.row);
}


@end
