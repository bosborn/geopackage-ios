//
//  GPKGRTreeIndexTableRow.m
//  geopackage-ios
//
//  Created by Brian Osborn on 9/12/18.
//  Copyright © 2018 NGA. All rights reserved.
//

#import "GPKGRTreeIndexTableRow.h"
#import "GPKGRTreeIndexExtension.h"

@implementation GPKGRTreeIndexTableRow

-(instancetype) initWithUserCustomRow: (GPKGUserCustomRow *) userCustomRow{
    self = [super initWithTable:[userCustomRow table] andColumnTypes:userCustomRow.columnTypes andValues:userCustomRow.values];
    return self;
}

-(int) id{
    return [[self idNumber] intValue];
}

-(NSNumber *) idNumber{
    return (NSNumber *)[self getValueWithIndex:[self getColumnIndexWithColumnName:GPKG_RTREE_INDEX_EXTENSION_COLUMN_ID]];
}

-(double) minX{
    return [((NSNumber *)[self getValueWithIndex:[self getColumnIndexWithColumnName:GPKG_RTREE_INDEX_EXTENSION_COLUMN_MIN_X]]) doubleValue];
}

-(double) maxX{
    return [((NSNumber *)[self getValueWithIndex:[self getColumnIndexWithColumnName:GPKG_RTREE_INDEX_EXTENSION_COLUMN_MAX_X]]) doubleValue];
}

-(double) minY{
    return [((NSNumber *)[self getValueWithIndex:[self getColumnIndexWithColumnName:GPKG_RTREE_INDEX_EXTENSION_COLUMN_MIN_Y]]) doubleValue];
}

-(double) maxY{
    return [((NSNumber *)[self getValueWithIndex:[self getColumnIndexWithColumnName:GPKG_RTREE_INDEX_EXTENSION_COLUMN_MAX_Y]]) doubleValue];
}

@end
