//
//  Pet.h
//  Phonagotchi
//
//  Created by Nelson Chow on 2016-03-17.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic) NSString *petName;
@property (nonatomic, readonly) BOOL isGrumpy;

@end
