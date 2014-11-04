//
//  MovieCellTableViewCell.m
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 04/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "MovieCellTableViewCell.h"

@implementation MovieCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MovieCell"];
    return self;
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    self.textLabel.text = movie.title;
    self.detailTextLabel.text = [[Movie movieDateFormatter] stringFromDate:movie.releaseDate];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
