//
//  Harpy.m
//  Harpy
//
//  Created by Arthur Ariel Sabintsev on 11/14/12.
//  Copyright (c) 2012 Arthur Ariel Sabintsev. All rights reserved.
//

#import "Harpy.h"
#import "HarpyConstants.h"

#define kHarpyCurrentVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey]
//#define kHarpyCurrentVersion @"1.0.9"

@interface Harpy ()
@end

@implementation Harpy

+ (void)checkVersion
{
    [CDStatusTool getLastVersionSuccess:^(CDVersionModel *result) {
        CDLog(@"%@",result);
        if (result){
            if ([kHarpyCurrentVersion compare:result.version options:NSNumericSearch] == NSOrderedAscending){
                [Harpy showAlertVersionModel:result];
            }
        }
        
    } failure:^(NSError *error) {
    }];
}

#pragma mark - Private Methods
+ (void)showAlertVersionModel:(CDVersionModel* )model
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:kYQGUpdateMessage(model.version) message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:kUpDateRightNow,kUpDateLater, nil];
    
    [[alertView rac_buttonClickedSignal] subscribeNext:^(NSNumber* x) {
        if ([x intValue] == 0){
            [CDTool updateAppVersion:model.url];
        }
        if ([x intValue] == 1 && model.model == 1){
            exit(0);
        }
    }];
    [alertView show];
}

@end
