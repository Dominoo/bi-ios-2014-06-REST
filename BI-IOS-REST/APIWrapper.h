//
//  APIWrapper.h
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIWrapper : NSObject

+ (void)feedsSuccess:(void (^)(NSArray *feeds))success failure:(void (^)())failure;


@end
