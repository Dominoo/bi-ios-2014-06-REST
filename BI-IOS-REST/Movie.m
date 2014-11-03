//
//  Movie.m
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithJSONObject:(id)object {
    self = [super init];
    if (self) {
        self.title = object[@"title"];
    }
    return self;
}
- (id)JSONObject {
    return nil;
}

@end
