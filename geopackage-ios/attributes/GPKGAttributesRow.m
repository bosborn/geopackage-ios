//
//  GPKGAttributesRow.m
//  geopackage-ios
//
//  Created by Brian Osborn on 11/17/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import "GPKGAttributesRow.h"

@implementation GPKGAttributesRow

-(instancetype) initWithAttributesTable: (GPKGAttributesTable *) table andColumns: (GPKGUserColumns *) columns andValues: (NSMutableArray *) values{
    self = [super initWithTable:table andColumns:columns andValues:values];
    if(self != nil){
        self.attributesTable = table;
    }
    return self;
}

-(instancetype) initWithAttributesTable: (GPKGAttributesTable *) table{
    self = [super initWithTable:table];
    if(self != nil){
        self.attributesTable = table;
    }
    return self;
}

-(NSObject *) toObjectValueWithIndex: (int) index andValue: (NSObject *) value{
    return value;
}

-(NSObject *) toDatabaseValueWithIndex: (int) index andValue: (NSObject *) value{
    return value;
}

-(id) mutableCopyWithZone: (NSZone *) zone{
    GPKGAttributesRow *attributesRow = [super mutableCopyWithZone:zone];
    attributesRow.attributesTable = _attributesTable;
    return attributesRow;
}

@end
