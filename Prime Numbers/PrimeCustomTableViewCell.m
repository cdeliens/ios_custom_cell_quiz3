//
//  PrimeCustomTableViewCell.m
//  Prime Numbers
//
//  Created by Christian Deliens on 2/18/17.
//  Copyright © 2017 Christian Deliens. All rights reserved.
//

#import "PrimeCustomTableViewCell.h"

@interface PrimeCustomTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *customLabel;


@end

@implementation PrimeCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setupCellWithNumber:(NSString*)number
{
    self.customLabel.text = number;
}

@end
