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

+ (void)feedsSuccess:(void (^)(NSArray *))success failure:(void (^)())failure
{
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    [[HTTPManager sharedManager] GET:@"feeds.json"
                          parameters:nil
                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                 NSArray *array = [responseObject isKindOfClass:[NSArray class]]? (NSArray *)responseObject : nil;
                                 if (!array) {
                                     failure();
                                 }
                                 
                                 NSMutableArray *feedArray = [NSMutableArray array];
                                 for (id object in array) {
                                     [feedArray addObject:[[Movie alloc] initWithJSONObject:object]];
                                 }
                                 
                                 // ulozit do databaze...
                                 
                                 success(feedArray);
                             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 ;
                             }];
    }

@end
