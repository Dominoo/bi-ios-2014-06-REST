//
//  Movie.m
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "Movie.h"
#import <ACKategories.h>

@implementation Movie

- (instancetype)initWithJSONObject:(id)object {
    self = [super init];
    if (self) {
        
       
        
        self.title = object[@"title"];
        self.movieID = object[@"id"];
        self.imdbURL = object[@"imdb_url"];
        self.releaseDate = [[Movie movieDateFormatter] dateFromString:object[@"release_date"]];
        TRC_ENTRY;
        
        
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %@",self.releaseDate,self.title,self.imdbURL];
}

+ (NSDateFormatter *)movieDateFormatter {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-mm-dd"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        return formatter;
    });
}

- (id)JSONObject {
    return nil;
}

@end
