//
//  Movie.h
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *imdbURL;

- (instancetype)initWithJSONObject:(id)object;
- (id)JSONObject;

@end
