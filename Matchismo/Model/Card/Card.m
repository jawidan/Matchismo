//
//  Card.m
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//


#import <Foundation/Foundation.h>
#import "Card.h"

@implementation Card : NSObject

-(int)match:(NSArray *)otherCards
{
    int score = 0;

    for(Card* card in otherCards){
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    return score;
}

@end
