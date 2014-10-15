//
//  NewsViewCell.h
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/29/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImg;
@property (weak, nonatomic) IBOutlet UIImageView *feedImg;
@property (weak, nonatomic) IBOutlet UILabel *lbFeedName;
@property (weak, nonatomic) IBOutlet UILabel *lbFeedContent;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn;
@end
