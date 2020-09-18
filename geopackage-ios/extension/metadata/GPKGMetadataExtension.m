//
//  GPKGMetadataExtension.m
//  geopackage-ios
//
//  Created by Brian Osborn on 5/4/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import "GPKGMetadataExtension.h"
#import "GPKGGeoPackageConstants.h"
#import "GPKGProperties.h"

NSString * const GPKG_METADATA_EXTENSION_NAME = @"metadata";
NSString * const GPKG_PROP_METADATA_EXTENSION_DEFINITION = @"geopackage.extensions.metadata";

@implementation GPKGMetadataExtension

-(instancetype) initWithGeoPackage: (GPKGGeoPackage *) geoPackage{
    self = [super initWithGeoPackage:geoPackage];
    if(self != nil){
        self.extensionName = [GPKGExtensions buildDefaultAuthorExtensionName:GPKG_METADATA_EXTENSION_NAME];
        self.definition = [GPKGProperties valueOfProperty:GPKG_PROP_METADATA_EXTENSION_DEFINITION];
    }
    return self;
}

-(NSArray<GPKGExtensions *> *) extensionCreate{
    
    NSMutableArray<GPKGExtensions *> *extensions = [[NSMutableArray alloc] init];
    
    [extensions addObject:[self extensionCreateWithName:self.extensionName andTableName:GPKG_M_TABLE_NAME andColumnName:nil andDefinition:self.definition andScope:GPKG_EST_READ_WRITE]];
    [extensions addObject:[self extensionCreateWithName:self.extensionName andTableName:GPKG_MR_TABLE_NAME andColumnName:nil andDefinition:self.definition andScope:GPKG_EST_READ_WRITE]];
    
    return extensions;
}

-(BOOL) has{
    
    BOOL exists = [self hasWithExtensionName:self.extensionName];
    
    return exists;
}

-(void) removeExtension{
    
    if([self.geoPackage isTable:GPKG_MR_TABLE_NAME]){
        [self.geoPackage dropTable:GPKG_MR_TABLE_NAME];
    }
    
    if([self.geoPackage isTable:GPKG_M_TABLE_NAME]){
        [self.geoPackage dropTable:GPKG_M_TABLE_NAME];
    }
    
    if([self.extensionsDao tableExists]){
        [self.extensionsDao deleteByExtension:self.extensionName];
    }
    
}

-(GPKGMetadataDao *) metadataDao{
    return [GPKGMetadataExtension metadataDaoWithGeoPackage:self.geoPackage];
}

+(GPKGMetadataDao *) metadataDaoWithGeoPackage: (GPKGGeoPackage *) geoPackage{
    return [GPKGMetadataDao createWithGeoPackage:geoPackage];
}

+(GPKGMetadataDao *) metadataDaoWithDatabase: (GPKGConnection *) database{
    return [GPKGMetadataDao createWithDatabase:database];
}

-(BOOL) createMetadataTable{
    [self verifyWritable];
    
    BOOL created = NO;
    GPKGMetadataDao *dao = [self metadataDao];
    if(![dao tableExists]){
        created = [[self.geoPackage tableCreator] createMetadata] > 0;
        if(created){
            GPKGMetadataExtension * metadataExtension = [[GPKGMetadataExtension alloc] initWithGeoPackage:self.geoPackage];
            [metadataExtension extensionCreate];
        }
    }
    
    return created;
}

-(GPKGMetadatReferenceaDao *) metadataReferenceDao{
    return [GPKGMetadataExtension metadataReferenceDaoWithGeoPackage:self.geoPackage];
}

+(GPKGMetadataReferenceDao *) metadataReferenceDaoWithGeoPackage: (GPKGGeoPackage *) geoPackage{
    return [GPKGMetadataReferenceDao createWithGeoPackage:geoPackage];
}

+(GPKGMetadataReferenceDao *) metadataReferenceDaoWithDatabase: (GPKGConnection *) database{
    return [GPKGMetadataReferenceDao createWithDatabase:database];
}

-(BOOL) createMetadataReferenceTable{
    [self verifyWritable];
    
    BOOL created = NO;
    GPKGMetadataReferenceDao *dao = [self metadataReferenceDao];
    if(![dao tableExists]){
        created = [[self.geoPackage tableCreator] createMetadataReference] > 0;
    }
    
    return created;
}

@end