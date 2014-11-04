//
//  APIWrapper.m
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "APIWrapper.h"
#import "Movie.h"
#import "HTTPManager.h"

@implementation APIWrapper

+ (void)moviesSuccess:(void (^)(NSArray *))success failure:(void (^)())failure
{
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    [[HTTPManager sharedManager] GET:@"movies/"
                          parameters:nil
                             success:^(NSURLSessionDataTask *task, id responseObject) {
    NSArray *array = (NSArray*) responseObject;
    if (!array) {
        failure();
    }
                                 
                                 
    NSMutableArray *moviesArray = [NSMutableArray array];
    for (NSDictionary* object in array) {
        [moviesArray addObject:[[Movie alloc] initWithJSONObject:object]];
    }
                                 
    success(moviesArray);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];
    
}

@end
