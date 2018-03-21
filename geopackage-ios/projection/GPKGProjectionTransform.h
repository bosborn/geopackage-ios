//
//  GPKGProjectionTransform.h
//  geopackage-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPKGProjection.h"
#import "GPKGBoundingBox.h"
#import "WKBPoint.h"
#import "GPKGSLocationCoordinate3D.h"
#import "GPKGSpatialReferenceSystem.h"

/**
 *  Projection transformation between a from and to projection
 */
@interface GPKGProjectionTransform : NSObject

/**
 *  From projection
 */
@property (nonatomic, strong) GPKGProjection *fromProjection;

/**
 *  To projection
 */
@property (nonatomic, strong) GPKGProjection *toProjection;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (GPKGProjection *) fromProjection andToProjection: (GPKGProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromEpsg from epsg
 *  @param toEpsg   to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toEpsg         to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (GPKGProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (GPKGProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (GPKGProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (GPKGProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toSrs   to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (GPKGSpatialReferenceSystem *) fromSrs andToSrs: (GPKGSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromSrs      from spatial reference system
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (GPKGSpatialReferenceSystem *) fromSrs andToProjection: (GPKGProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toSrs          to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (GPKGProjection *) fromProjection andToSrs: (GPKGSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toEpsg  to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (GPKGSpatialReferenceSystem *) fromSrs andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (GPKGSpatialReferenceSystem *) fromSrs andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg from epsg
 *  @param toSrs    to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToSrs: (GPKGSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toSrs    to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToSrs: (GPKGSpatialReferenceSystem *) toSrs;

/**
 *  Transform a location coordinate
 *
 *  @param from location coordinate
 *
 *  @return transformed location coordinate
 */
-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from;

/**
 *  Transform a 3d location coordinate
 *
 *  @param from 3d location coordinate
 *
 *  @return transformed 3d location coordinate
 */
-(GPKGSLocationCoordinate3D *) transform3d: (GPKGSLocationCoordinate3D *) from;

/**
 *  Transform a point
 *
 *  @param from point to transform
 *
 *  @return transformed point
 */
-(WKBPoint *) transformWithPoint: (WKBPoint *) from;

/**
 *  Transform an array of points
 *
 *  @param from points to transform
 *
 *  @return transformed points
 */
-(NSArray<WKBPoint *> *) transformWithPoints: (NSArray<WKBPoint *> *) from;

/**
 *  Transform a geometry
 *
 *  @param from geometry
 *
 *  @return projected geometry
 */
-(WKBGeometry *) transformWithGeometry: (WKBGeometry *) from;

/**
 *  Transform a bounding box
 *
 *  @param boundingBox bounding box to transform
 *
 *  @return transformed bounding box
 */
-(GPKGBoundingBox *) transformWithBoundingBox: (GPKGBoundingBox *) boundingBox;

/**
 *  Transform a x and y coordinate
 *
 *  @param x x coordinate
 *  @param y y coordinate
 *
 *  @return array containing x and y coordinate
 */
-(NSArray *) transformWithX: (double) x andY: (double) y;

/**
 * Is the from and to projection the same?
 *
 * @return true if the same projection
 */
-(BOOL) isSameProjection;

@end
